import 'package:admin/notice/NoticeDetail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'notice_controller.dart';


class Noticelist extends StatefulWidget {

  @override
  _NoticelistState createState() => _NoticelistState();
}

class _NoticelistState extends State<Noticelist> {
  var refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    // UserController u = Get.find();

    //객체 생성 (create),  onInit 함수실행(initialize)
    NoticeController nc = Get.put(NoticeController());
    nc.findAllNoticelist();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("내가 등록한 공지사항",
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
            await nc.findAllNoticelist();
          },
          child: ListView.separated(
            itemCount: nc.posts.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () async{
                  await nc.findByNoticeId(nc.posts[index].id!);
                  Get.to(NoticeDetailPage(nc.posts[index].id));
                },
                title: Text("${nc.posts[index].title}",
                  style: TextStyle(fontSize: 17),
                ),
                subtitle: Text("작성일 : ${nc.posts[index].create_date}\n 학급코드 : ${nc.posts[index].class_code}"
                    ,style: TextStyle(fontSize: 13)
                ),
                leading: Text(
                  "${nc.posts[index].id}",
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