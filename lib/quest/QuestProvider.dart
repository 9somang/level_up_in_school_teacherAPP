import 'package:admin/user/user_controller.dart';
import 'package:get/get.dart';
import 'package:admin/Token/token.dart';

const host = "http://43.201.142.6:5000";
UserController u = Get.find();
// 통신
class QuestProvider extends GetConnect {


  Future<Response> Questsave(Map data) =>
      post("$host/quest/app/${u.principal.value.user_id}", data, headers: {"authorization" : jwtToken ?? ""});

  Future<Response> findAllQuestlist() =>
      get("$host/quest/app/${u.principal.value.user_id}", headers: {"authorization" : jwtToken ?? ""});

  Future<Response> findByQuestId(int id) =>
      get("$host/quest/app/${u.principal.value.user_id}/$id", headers: {"authorization" : jwtToken ?? ""});

  Future<Response> deleteByQuestId(int id) =>
      delete("$host/quest/app/${u.principal.value.user_id}/$id", headers: {"authorization" : jwtToken ?? ""});

  Future<Response> Questupdate(int id, Map data) =>
      put("$host/quest/app/${u.principal.value.user_id}/$id", data,headers: {"authorization" : jwtToken ?? ""});




}