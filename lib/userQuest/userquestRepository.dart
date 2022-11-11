import 'package:admin/userQuest/userquestProvider.dart';
import 'package:flutter/services.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import '../Dto/CMRespDto.dart';
import '../Dto/CheckReqDto.dart';
import '../Dto/QuestSaveReqDto.dart';
import '../Dto/UpdateReqDto.dart';
import '../model/post.dart';
import '../model/userPost.dart';


class userQuestRepository {
  final userQuestProvider _userQuestProvider = userQuestProvider();



  Future<List<userPost>> findAllQuestlist() async {
    Response response = await _userQuestProvider.findAllUserQuestlist();
    dynamic body = response.body;
    print("${body}");
    // dynamic convertBody = convertUtf8ToObject(body); // utf-8 한글 깨짐 해결
    CMRespDto cmRespDto = CMRespDto.fromJson(body);
    if (cmRespDto.code == 1) {
      List<dynamic> temp = cmRespDto.data;
      List<userPost> posts = temp.map((userpost) => userPost.fromJson(userpost)).toList();
      return posts;
    } else {
      return <userPost>[]; // 빈배열 호출
    }
  }

  Future<userPost> findByQuestId(int id) async{
    Response response = await _userQuestProvider.findByUserQuestId(id);
    dynamic body = response.body;
    print("${body}");
    // dynamic convertBody = convertUtf8ToObject(body);
    CMRespDto cmRespDto = CMRespDto.fromJson(body);

    if(cmRespDto.code == 1) {
      userPost post = userPost.fromJson(cmRespDto.data);
      return post;
    }else {
      return userPost();
    }
  }

  //
  // Future<int> deleteByQuestId(int id) async{
  //   Response response = await _QuestProvider.deleteByQuestId(id);
  //   dynamic body = response.body;
  //   CMRespDto cmRespDto = CMRespDto.fromJson(body);
  //
  //   return cmRespDto.code ?? -1;  // 또는 code!;
  // }
  //
  Future<userPost> Questcheck(int id)async{
    // CheckReqDto checkReqDto = CheckReqDto(user_id);
    Response response = await _userQuestProvider.Questcheck(id);
    dynamic body = response.body;
    print("${body}");
    // dynamic convertBody = convertUtf8ToObject(body);
    CMRespDto cmRespDto = CMRespDto.fromJson(body);
    print("데이터 : ${cmRespDto.data}");

    if(cmRespDto.code == 1){
      print("퀘스트완료");
      return userPost();
    }else {
      print("실패");
      return userPost();
    }
  }






}