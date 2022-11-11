import 'package:admin/quest/questDetail.dart';
import 'package:admin/quest/quest_controller.dart';
import 'package:admin/userQuest/userquestController.dart';
import 'package:admin/userQuest/userquestDetail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../homepage.dart';

class userQuestlist extends StatefulWidget {

  @override
  _userQuestlistState createState() => _userQuestlistState();
}

class _userQuestlistState extends State<userQuestlist> {
  var refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    // UserController u = Get.find();

    //객체 생성 (create),  onInit 함수실행(initialize)
    userQuestController uqn = Get.put(userQuestController());
    uqn.findAllUserQuestlist();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("학생들이 완료한 퀘스트 목록",
          style: TextStyle(
              fontSize: 20,
              color: Colors.white
          ),
        ),
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            color: Colors.white,
            icon: Icon(Icons.arrow_back)),
        elevation: 2,

      ),
      body: Obx(
            ()=> RefreshIndicator(
          key: refreshKey,
          onRefresh: () async {
            await uqn.findAllUserQuestlist();
          },
          child: ListView.separated(
            itemCount: uqn.posts.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () async{
                  await uqn.findByUserQuestId(uqn.posts[index].id!);
                  Get.to(userquestDetailPage(uqn.posts[index].id));
                },
                title: Text("${uqn.posts[index].title}",
                  style: TextStyle(fontSize: 17),
                ),
                subtitle: Text("포인트 : ${uqn.posts[index].point}   경험치 : ${uqn.posts[index].exp}\n학생 이름 : ${uqn.posts[index].user_id}"
                    ,style: TextStyle(fontSize: 13)
                ),
                leading: Text(
                  "${uqn.posts[index].pickedStdate}일부터\n${uqn.posts[index].pickedEnddate}일까지",
                  style: TextStyle(fontSize: 10),
                ),

              );
            },

            separatorBuilder: (context, index) {
              return Divider();
            },
          ),
        ),
      ),
    );
  }

  void _checkDialog(BuildContext context) {
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
                  // await uqn.QuestCheck();
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

}