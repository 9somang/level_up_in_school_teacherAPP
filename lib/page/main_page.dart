
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Mainpage extends StatelessWidget{
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
                print('Icon button');
              },
              icon: Icon(Icons.wysiwyg, size: 30, color: Colors.black87), // 아이콘 색
              label: Text('학급 관리'),
              style: TextButton.styleFrom(primary: Colors.black), // 글자 색
            ),
          ],
        ),
      ),
    );
  }

}