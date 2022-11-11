import 'package:admin/user/user_controller.dart';
import 'package:get/get.dart';
import 'package:admin/Token/token.dart';

const host = "http://43.201.142.6:5000";
UserController u = Get.find();
// 통신
class userQuestProvider extends GetConnect {



  Future<Response> findAllUserQuestlist() =>
      get("$host/quest/app/uq/${u.principal.value.user_id}", headers: {"authorization" : jwtToken ?? ""});

  Future<Response> findByUserQuestId(int id) =>
      get("$host/quest/app/uq/${u.principal.value.user_id}/$id", headers: {"authorization" : jwtToken ?? ""});

  Future<Response> Questcheck(int id) =>
      put("$host/quest/app/check/${u.principal.value.user_id}/$id",null,headers: {"authorization" : jwtToken ?? ""});





  // Future<Response> deleteByQuestId(int id) =>
  //     delete("$host/quest/app/${u.principal.value.user_id}/$id", headers: {"authorization" : jwtToken ?? ""});
  //





}