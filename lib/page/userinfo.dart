import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../user/user_controller.dart';

class UserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserController u = Get.find();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('정보 확인'),
        backgroundColor: Colors.black,
      ),
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(''),
                fit: BoxFit.scaleDown,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.2), BlendMode.dstATop)),
          ),
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("교사 이름 : ${u.principal.value.username}",
                    style: const TextStyle(
                        fontSize: 20
                    ),
                  ),
                  Text("이메일 : ${u.principal.value.email}",
                    style: const TextStyle(
                        fontSize: 20
                    ),
                  ),
                ]
            ),
          )
      ),
    );
  }
}
