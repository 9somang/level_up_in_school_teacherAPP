import 'package:admin/quest/quest_controller.dart';
import 'package:admin/view/custom_elevated_button.dart';
import 'package:admin/view/custom_text_form_field.dart';
import 'package:admin/view/customtextarea.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../homepage.dart';
import '../user/user_controller.dart';


class QuestWritePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState()=> QuestWriteTwoPage();
}

class QuestWriteTwoPage extends State<QuestWritePage> {
  Widget build(BuildContext context) {


    QuestController Qt = Get.put(QuestController());

    final formkey = GlobalKey<FormState>();

    final _title = TextEditingController();
    final _exp = TextEditingController();
    final _description = TextEditingController();
    final _point = TextEditingController();
    final _class_code = TextEditingController();
    final pickedStdate = Get.find<QuestController>().selectedStDate.value;
    final pickedEnddate = Get.find<QuestController>().selectedEndDate.value;



    UserController u = Get.find();


    return Scaffold(
      appBar: AppBar(
        title: Text('퀘스트 등록하기',
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
            key: formkey,
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
                  text: "퀘스트 수행 요청 보내기!",
                  funpageRoute: () async {
                    if (formkey.currentState!.validate()) {
                      await Get.find<QuestController>()
                      .Questsave( _title.text, _description.text ,int.parse(_exp.text),int.parse(_point.text),_class_code.text,pickedStdate, pickedEnddate);
                      Get.to(()=>HomePage());
                      showToast("퀘스트 등록 완료!");
                    }else{
                      showToast("퀘스트 등록 실패!");
                    }

                  },
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