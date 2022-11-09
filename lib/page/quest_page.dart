
import 'package:admin/quest/questDetail.dart';
import 'package:admin/quest/questWrite.dart';
import 'package:admin/quest/questlist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../quest/quest_controller.dart';


class Questpage extends StatelessWidget{
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
                Get.to(()=>QuestWritePage());
              },
              icon: Icon(Icons.add, size: 30, color: Colors.black87), // 아이콘 색
              label: Text('퀘스트 등록하기'),
              style: TextButton.styleFrom(primary: Colors.black), // 글자 색
            ),
            OutlinedButton.icon(
              // 텍스트버튼에 아이콘 넣기
              onPressed: () {
                Get.to(()=>Questlist());;
              },
              icon: Icon(Icons.add_to_home_screen, size: 30, color: Colors.black87), // 아이콘 색
              label: Text('퀘스트 확인하기'),
              style: TextButton.styleFrom(primary: Colors.black), // 글자 색
            ),
          ],
        ),
      ),
    );
  }

}