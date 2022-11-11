import 'package:admin/quest/questUpdate.dart';
import 'package:admin/quest/quest_controller.dart';
import 'package:admin/userQuest/userquestController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../homepage.dart';
import '../user/user_controller.dart';

class userquestDetailPage extends StatelessWidget {
  final int? id;

  const userquestDetailPage(this.id);

  @override
  Widget build(BuildContext context) {
    //String data = Get.arguments;
    UserController u = Get.find();
    userQuestController uqn = Get.find();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0.0,
          title: Text("등록한 퀘스트"),
          centerTitle: true,
        ),

        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(()=> Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${uqn.post.value.title}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23)
              ),
              Divider(),
              Container(
                child: Text("시작일 : ${uqn.post.value.pickedStdate}, 종료일 : ${uqn.post.value.pickedEnddate}"),
              ),
              Container(
                child: Text("경험치 : ${uqn.post.value.exp}, 포인트 : ${uqn.post.value.point}"),
              ),
              Container(
                child: Text("학생 : ${uqn.post.value.user_id}"),
              ),
              SizedBox(height: 5),

              if (uqn.post.value.done != false
              ) Row(
                children: [
                  SizedBox(width: 7),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        onPrimary: Colors.white,
                      ),
                      onPressed: () {
                         _checkDialog(context);// Done ( controller ) 함수 실행시키기
                      },
                      child: Text("퀘스트 완료 승인하기")
                  ),
                  SizedBox(width: 7),
                  SizedBox(width: 10),
                ],
              ) else SizedBox(),
              SizedBox(height:7),
              Expanded(
                  child: SingleChildScrollView(
                    child: Text("${uqn.post.value.discription}"),
                  )
              ),
            ],
          ),
          ),
        )
    );
  }
}


void _checkDialog(BuildContext context) {
  final user_id = Get.find<userQuestController>().post.value.user_id;
  userQuestController  uqn = Get.find();
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("퀘스트 완료를 승인하시겠습니까?"),
          content: SingleChildScrollView(
            child: ListBody(
                children: const <Widget>[
                  Text('퀘스트를 완료를 승인하고 해당 학생에게 포인트와 경험치를 수여합니다.')
                ]
            ),
          ),
          actions: [
            ElevatedButton(
              child: Text("예"),
              onPressed: () async{
                Navigator.of(context).pop(); // 저장소에서 해당 게시물삭제
                _checkDialog(context);
                await uqn.QuestCheck(uqn.post.value.id ?? 0);
                Get.off(()=> HomePage());
              },
            ),
            ElevatedButton(
              child: Text("아니요"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      });
}

