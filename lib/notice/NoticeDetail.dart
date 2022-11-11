import 'package:admin/notice/NoticeUpdate.dart';
import 'package:admin/quest/questUpdate.dart';
import 'package:admin/quest/quest_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../homepage.dart';
import '../user/user_controller.dart';
import 'notice_controller.dart';


class NoticeDetailPage extends StatelessWidget {
  final int? id;

  const NoticeDetailPage(this.id);

  @override
  Widget build(BuildContext context) {
    //String data = Get.arguments;
    UserController u = Get.find();
    NoticeController nc = Get.find();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0.0,
          title: Text("등록한 공지사항"),
          centerTitle: true,
        ),

        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(()=> Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${nc.post.value.title}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23)
              ),
              Divider(),
              Container(
                child: Text("작성일 : ${nc.post.value.create_date}"),
              ),
              Container(
                child: Text("학급 코드 : ${nc.post.value.class_code}"),
              ),
              SizedBox(height: 5),

              if (u.principal.value.id != null
              ) Row(
                children: [
                  SizedBox(width: 7),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.indigo,
                        onPrimary: Colors.white,
                      ),
                      onPressed: () {
                        _deleteDialog(context); // 상태관리로 갱신 시킬 수 있음.
                      },
                      child: Text("삭제")
                  ),
                  SizedBox(width: 7),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.indigo,
                        onPrimary: Colors.white,
                      ),
                      onPressed: () {
                        Get.to(()=> NoticeUpdatePage());
                      },
                      child: Text("수정")
                  ),
                  SizedBox(width: 10),
                ],
              ) else SizedBox(),
              SizedBox(height:7),
              Expanded(
                  child: SingleChildScrollView(
                    child: Text("${nc.post.value.content}"),
                  )
              ),
            ],
          ),
          ),
        )
    );
  }
}


void _deleteDialog(BuildContext context) {
  NoticeController  nc = Get.find();
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("정말로 공지사항을 삭제하시겠습니까?"),
          content: SingleChildScrollView(
            child: ListBody(
                children: const <Widget>[
                  Text('공지사항을 삭제하면 되돌릴 수 없습니다.')
                ]
            ),
          ),
          actions: [
            ElevatedButton(
              child: Text("예"),
              onPressed: () async{
                Navigator.of(context).pop(); // 저장소에서 해당 게시물삭제
                _deleteDialog(context);
                await nc.deleteByNoticeId(nc.post.value.id!);
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

