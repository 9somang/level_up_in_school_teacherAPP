
import 'package:admin/user/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../Token/register_code.dart';
import '../validate.dart';
import '../view/custom_elevated_button.dart';
import '../view/custom_text_form_field.dart';
import 'Login.dart';


// 로그인이랑 똑같이 만들기 ( 상태관리 필요없음 )
class JoinPage extends StatelessWidget {

  final _formkey = GlobalKey<FormState>();
  final UserController u = Get.put(UserController()); // 상태관리라서 get.put사용
  final _username = TextEditingController();
  final _userid = TextEditingController();
  final _password = TextEditingController();
  final _schoolcode = TextEditingController();
  final _classcode = TextEditingController();
  final _email = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Container(
        child: Padding(

          padding: const EdgeInsets.all(30.0),
          child: ListView(
            children: [

                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(0),
                  padding: EdgeInsets.fromLTRB(0, 0, 0,0),
                  height: 80,
                  child: const Text(
                    "회원가입",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize:30,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              _JoinForm()
            ],
          ),
        ),
      ),
    );
  }

  Widget _JoinForm() { // 항상 return 타입은 최상위보호타입으로 잡아주는게좋음(widget)
    return Form(    // 나중에 DB 서버에 한번에 날려야 하기 때문에 form안에 한꺼번에 감싸버려버려
      key: _formkey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: _username,
            hint: "교사 성함",
            funValidator: validateUsername(),
          ),
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
          CustomTextFormField(
            controller: _schoolcode,
            hint: "학교 코드",
            funValidator: null,
          ),
          CustomTextFormField(
            controller: _classcode,
            hint: "학급 코드",
            funValidator: null,
          ),
          CustomTextFormField(
            controller: _email,
            hint: "이메일",
            funValidator: null,
          ),
          CustomElevatedButton(
            text: "회원가입",
            funpageRoute: ()async{
              if(_formkey.currentState!.validate()) {
                await u.register(_username.text.trim(), _userid.text.trim(), _password.text.trim(), _schoolcode.text.trim(),_classcode.text.trim() ,_email.text.trim()
                );
                int? result = await register_code;
                if (result == 1){
                  showToast('회원가입이 완료 되었습니다');
                  Get.offAll(()=> LoginPage());
                } else {
                  showToast('회원가입에 실패하였습니다');
                }
              }
            },
          ),
          TextButton(onPressed: (){
            Get.offAll(LoginPage());
          },
            style: TextButton.styleFrom(
                  primary: Colors.purpleAccent
            ),
              child: const Text(
                  "로그인페이지로"
              ),
          ),
        ],
      ),
    );
  }
  void showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM
    );
  }
}




