import 'package:admin/quest/questDetail.dart';
import 'package:admin/quest/quest_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Questlist extends StatefulWidget {

  @override
  _QuestlistState createState() => _QuestlistState();
}

class _QuestlistState extends State<Questlist> {
  var refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    // UserController u = Get.find();

    //객체 생성 (create),  onInit 함수실행(initialize)
    QuestController qn = Get.put(QuestController());
    qn.findAllQuestlist();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("내가 등록한 퀘스트 목록",
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
            await qn.findAllQuestlist();
          },
          child: ListView.separated(
            itemCount: qn.posts.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () async{
                  await qn.findByQuestId(qn.posts[index].id!);
                  Get.to(questDetailPage(qn.posts[index].id));
                },
                title: Text("${qn.posts[index].title}",
                  style: TextStyle(fontSize: 17),
                ),
                subtitle: Text("포인트 : ${qn.posts[index].point}   경험치 : ${qn.posts[index].exp}\n학급코드 : ${qn.posts[index].class_code}"
                    ,style: TextStyle(fontSize: 13)
                ),
                leading: Text(
                  "${qn.posts[index].pickedStdate}일부터\n${qn.posts[index].pickedEnddate}일까지",
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
}