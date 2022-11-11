import 'package:admin/view/customtextareatwo.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../homepage.dart';
import '../user/user_controller.dart';
import '../validate.dart';
import '../view/custom_elevated_button.dart';
import '../view/custom_text_form_field.dart';
import '../view/customtextarea.dart';
import 'package:get/get.dart';

import 'notice_controller.dart';






class NoticeUpdatePage extends StatelessWidget {

  final _formkey = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _content = TextEditingController();
  final _class_code = TextEditingController();


  @override
  Widget build(BuildContext context) {

    NoticeController nc = Get.put(NoticeController());
    UserController u = Get.find();

    _title.text= "${nc.post.value.title}";
    _content.text= "${nc.post.value.content}";
    _class_code.text = "${nc.post.value.class_code}";
    final create_date = Get.find<NoticeController>().create_date;

    return Scaffold(
      appBar: AppBar(
        title: Text('공지사항 수정하기',
            style: TextStyle(
              fontFamily: 'GowunDodum',
              fontSize: 20,
            )),
        backgroundColor: Colors.black,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            key: _formkey,
            child: ListView(
              children: [
                CustomTextFormField(
                    controller: _title,
                    hint: "제목",
                    funValidator: validateTitle()
                ),
                CustomTextFormAreatwo(
                    controller: _content,
                    hint: "내용",
                    funValidator: validateContent()
                ),
                CustomTextFormField(
                    controller: _class_code,
                    hint: "학급코드",
                    funValidator: null
                ),
                CustomElevatedButton(
                  text: "공지사항 수정하기",
                  funpageRoute: () async{
                    if( _formkey.currentState!.validate()) {
                      await nc.Noticeupdate(
                          nc.post.value.id ?? 0,
                          _title.text,
                          _content.text,
                          _class_code.text,
                          DateFormat('yyyy-MM-dd').format(create_date));
                      Get.off(()=>HomePage());
                    }
                  },
                ),
              ],
            )
        ),
      ),
    );
  }
}