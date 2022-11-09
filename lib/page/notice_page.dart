
import 'package:admin/notice/notice_write.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Noticepage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton.icon(
              // 텍스트버튼에 아이콘 넣기
              onPressed: () {
                Get.to(()=> NoticeWritePage());
              },
              icon: Icon(Icons.add_alert_sharp, size: 30, color: Colors.black87), // 아이콘 색
              label: Text('공지사항 등록하기'),
              style: TextButton.styleFrom(primary: Colors.black), // 글자 색
            ),
            OutlinedButton.icon(
              // 텍스트버튼에 아이콘 넣기
              onPressed: () {
                Get.to(()=> NoticeWritePage());
              },
              icon: Icon(Icons.check_box_rounded, size: 30, color: Colors.black87), // 아이콘 색
              label: Text('공지사항 확인하기'),
              style: TextButton.styleFrom(primary: Colors.black), // 글자 색
            ),
          ],
        ),
      ),
    );
  }

}