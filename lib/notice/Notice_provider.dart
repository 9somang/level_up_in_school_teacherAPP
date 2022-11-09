import 'package:get/get.dart';

import '../user/user_controller.dart';

const host = "http://43.201.142.6:5000";

UserController u = Get.find();

// 통신
class NoticeProvider extends GetConnect {

  Future<Response> Noticesave(Map data) =>
      post("$host/notice/app/${u.principal.value.user_id}", data);


// Future<Response> findAllJobNotice() =>
//     get("$host/jobnotice/", headers: {"authorization" : jwtToken ?? ""});
//
// Future<Response> findByJobnoId(int id) =>
//     get("$host/jobnotice/$id", headers: {"authorization" : jwtToken ?? ""});
//
// Future<Response> deleteByJobnoId(int id) =>
//     delete("$host/jobnotice/$id", headers: {"authorization" : jwtToken ?? ""});
//
// Future<Response> Jobnoupdate(int id, Map data) =>
//     put("$host/jobnotice/$id", data,headers: {"authorization" : jwtToken ?? ""});

}