import 'package:flutter/services.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import '../Dto/CMRespDto.dart';
import '../Dto/QuestSaveReqDto.dart';
import '../Dto/UpdateReqDto.dart';
import '../post.dart';
import 'QuestProvider.dart';


class QuestRepository {
  final QuestProvider _QuestProvider = QuestProvider();

  Future<Post> Questsave(String title, String description,int exp, int point,String class_code, DateTime pickedStdate, DateTime pickedEnddate)async{
    QuestSaveReqDto saveReqDto = QuestSaveReqDto(title, description,exp,point,class_code,pickedStdate, pickedEnddate);
    Response response = await _QuestProvider.Questsave(saveReqDto.toJson());
    dynamic body = response.body;
    print("반환값 : $body");
    // dynamic convertBody = convertUtf8ToObject(body);
    CMRespDto cmRespDto = CMRespDto.fromJson(body);
    print("cmResponseDto.data : ${cmRespDto.data}");

    if(cmRespDto.code == 1){
      print("퀘스트등록 성공");
      Post post = Post.fromJson(cmRespDto.data);
      return post;
    }else {
      print("퀘스트등록 실패");
      return Post();
    }
  }

  Future<List<Post>> findAllQuestlist() async {
    Response response = await _QuestProvider.findAllQuestlist();
    dynamic body = response.body;
    // dynamic convertBody = convertUtf8ToObject(body); // utf-8 한글 깨짐 해결
    CMRespDto cmRespDto = CMRespDto.fromJson(body);
    if (cmRespDto.code == 1) {
      List<dynamic> temp = cmRespDto.data;
      List<Post> posts = temp.map((post) => Post.fromJson(post)).toList();
      return posts;
    } else {
      return <Post>[]; // 빈배열 호출
    }
  }

  Future<Post> findByQuestId(int id) async{
    Response response = await _QuestProvider.findByQuestId(id);
    dynamic body = response.body;
    print("${body}");
    // dynamic convertBody = convertUtf8ToObject(body);
    CMRespDto cmRespDto = CMRespDto.fromJson(body);

    if(cmRespDto.code == 1) {
      Post post = Post.fromJson(cmRespDto.data);
      return post;
    }else {
      return  Post();
    }
  }


  Future<int> deleteByQuestId(int id) async{
    Response response = await _QuestProvider.deleteByQuestId(id);
    dynamic body = response.body;
    CMRespDto cmRespDto = CMRespDto.fromJson(body);

    return cmRespDto.code ?? -1;  // 또는 code!;
  }

  Future<Post> Questupdate(int id, String title, String description,int exp, int point,String class_code, DateTime pickedStdate, DateTime pickedEnddate)async{
    UpdateReqDto updateReqDto = UpdateReqDto(title, description,exp,point,class_code,pickedStdate, pickedEnddate);
    Response response = await _QuestProvider.Questupdate(id, updateReqDto.toJson());
    dynamic body = response.body;
    print("${body}");
    // dynamic convertBody = convertUtf8ToObject(body);
    CMRespDto cmRespDto = CMRespDto.fromJson(body);
    print("데이터 : ${cmRespDto.data}");

    if(cmRespDto.code == 1){
      print("수정성공");
      Post post = Post.fromJson(cmRespDto.data);
      return post;
    }else {
      print("수정실패");
      return Post();
    }
  }






}