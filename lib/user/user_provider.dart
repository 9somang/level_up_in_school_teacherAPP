import 'package:get/get.dart';

const host = "http://43.201.142.6:5000/auth";
// 통신
class UserProvider extends GetConnect {

  Future<Response> register(Map data)=> post("$host/singnup/",data);

  Future<Response> login(Map data) => post ("$host/login/",data);
}
