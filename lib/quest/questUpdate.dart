import 'package:admin/homepage.dart';
import 'package:admin/quest/quest_controller.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../validate.dart';
import '../view/custom_elevated_button.dart';
import '../view/custom_text_form_field.dart';
import '../view/customtextarea.dart';



class questUpdatePage extends StatelessWidget {


  final _formkey = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _description = TextEditingController();
  final _exp = TextEditingController();
  final _point = TextEditingController();
  final _class_code = TextEditingController();
  final pickedStdate = Get.find<QuestController>().selectedStDate.value;
  final pickedEnddate = Get.find<QuestController>().selectedEndDate.value;

  @override
  Widget build(BuildContext context) {
    final QuestController qn = Get.find();
    _title.text= "${qn.post.value.title}";
    _description.text= "${qn.post.value.discription}";
    _exp.text = "${qn.post.value.exp}";
    _point.text = "${qn.post.value.point}";
    _class_code.text = "${qn.post.value.class_code}";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: Text("퀘스트 수정하기"),
        centerTitle: true,
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
                    funValidator: null
                ),
                CustomTextFormArea(
                    controller: _description,
                    hint: "설명",
                    funValidator: null
                ),
                CustomTextFormField(
                    controller: _exp,
                    hint: "경험치(Min:10,Max:500)",
                    funValidator: null
                ),
                CustomTextFormField(
                    controller: _point,
                    hint: "포인트(Min:50,Max:500)",
                    funValidator: null
                ),
                CustomTextFormField(
                    controller: _class_code,
                    hint: "학급코드",
                    funValidator: null
                ),
                Obx(()=> Text('시작 : ${DateFormat('yyyy-MM-dd')
                    .format(Get.find<QuestController>()
                    .selectedStDate.value)}',
                  textAlign: TextAlign.center,
                )),
                ElevatedButton(
                  onPressed: ()=> Get.find<QuestController>().chooseStDate(),
                  style: TextButton.styleFrom(backgroundColor: Colors.indigo),
                  child: Text('시작날짜선택'),

                ),
                Obx(()=> Text('종료 : ${DateFormat('yyyy-MM-dd')
                    .format(Get.find<QuestController>()
                    .selectedEndDate.value)}',
                  textAlign: TextAlign.center,
                )),
                ElevatedButton(
                  onPressed: ()=> Get.find<QuestController>().chooseEndDate(),
                  style: TextButton.styleFrom(backgroundColor: Colors.indigo),
                  child: Text('종료날짜선택'),

                ),
                CustomElevatedButton(
                    text: "퀘스트 수정하기",
                    funpageRoute: () async{
                      if( _formkey.currentState!.validate()) {
                        await qn.Questupdate(
                            qn.post.value.id ?? 0, _title.text, _description.text,int.parse(_exp.text),int.parse(_point.text),_class_code.text,pickedStdate, pickedEnddate
                        );
                        Get.to(()=> HomePage());
                        showToast("퀘스트 수정 완료");
                      }
                      // 같은 page가 있으면 이동할때 덮어씌우기 < 이게 레알 최고
                      Get.back(); //상태관리 Getx 라이브러리 - obs(데이터갱신)
                    }
                ),
              ],
            )
        ),
      ),
    );
  }
  void showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM
    );
  }
}