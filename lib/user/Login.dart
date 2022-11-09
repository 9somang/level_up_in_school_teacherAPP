import 'package:admin/user/user_controller.dart';
import 'package:admin/homepage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../validate.dart';
import '../view/custom_elevated_button.dart';
import '../view/custom_text_form_field.dart';
import 'join.dart';

class LoginPage extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();
  final UserController u = Get.put(UserController());

  final _userid = TextEditingController();
  final _password = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0,50,0,20),
                width: 500,
                height: 150,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/한양티비로고.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.fromLTRB(0, 0, 0,0),
                height: 45,
                child: const Text(
                  "로그인",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize:30,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              _loginForm()

            ],
          ),
        ),
      ),
    );
  }

  Widget _loginForm() {
    // 항상 return 타입은 최상위보호타입으로 잡아주는게좋음(widget)
    return Form(
      // 나중에 DB 서버에 한번에 날려야 하기 때문에 form안에 한꺼번에 감쌈
      key: _formkey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: _userid,
            hint: "아이디",
            funValidator: validateUsername(),
          ),
          CustomTextFormField(
            controller: _password,
            hint: "비밀번호",
            funValidator: validatePassword(),
          ),
          CustomElevatedButton(
            text: "로그인",
            funpageRoute: () async{
              if (_formkey.currentState!.validate()) {
                int result =
                await u.login(_userid.text.trim(), _password.text.trim());
                print(result);
                if (result == 1) {
                  Get.offAll(HomePage());
                  showToastlogin('환영합니다.\n${u.principal.value.username} 선생님!');
                }else {showToastlogin('로그인 실패');}
              }
            },
          ),
          TextButton(
            onPressed: () {
              Get.to(JoinPage());
            },
            style: TextButton.styleFrom(
                primary: Colors.purpleAccent
          ),
            child: const Text(
              "회원가입이 안되어 있다면 ?",
              textAlign: TextAlign.center,
            ),
          ),
          // TextButton(
          //   onPressed: (){
          //     Get.to(HomePage());
          //   },
          //   child: const Text(
          //       "홈화면으로(임시)",
          //       textAlign: TextAlign.center
          //   ),
          // )
        ],
      ),
    );
  }

  void showToastlogin(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER
    );
  }
}
