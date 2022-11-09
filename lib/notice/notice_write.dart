import 'package:flutter/material.dart';
import '../homepage.dart';
import '../user/user_controller.dart';
import '../validate.dart';
import '../view/custom_elevated_button.dart';
import '../view/custom_text_form_field.dart';
import '../view/customtextarea.dart';
import 'package:get/get.dart';

import 'notice_controller.dart';






class NoticeWritePage extends StatelessWidget {

  final _formkey = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _content = TextEditingController();
  final _school_code = TextEditingController();


  @override
  Widget build(BuildContext context) {

    NoticeController Nt = Get.put(NoticeController());
    UserController u = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text('공지사항 등록하기',
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
                    controller: _school_code,
                    hint: "학급코드",
                    funValidator: null
                ),
                CustomTextFormField(
                    controller: _title,
                    hint: "제목",
                    funValidator: validateTitle()
                ),
                
                CustomTextFormArea(
                    controller: _content,
                    hint: "내용",
                    funValidator: validateContent()
                ),
                CustomElevatedButton(
                  text: "공지사항 등록!",
                  funpageRoute: () async{
                    if( _formkey.currentState!.validate()) {
                      await Get.find<NoticeController>()
                          .Noticesave(_title.text, _content.text,_school_code.text, "${u.principal.value.username}");
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