
import 'package:get/get_connect/http/src/response/response.dart';
import '../Dto/CMRespDto.dart';
import '../Dto/NoticeSaveReqDto.dart';
import '../post.dart';
import 'Notice_provider.dart';

class NoticeRepository {
  final NoticeProvider _NoticeProvider = NoticeProvider();

  Future<Post> Noticesave(String title, String content, username, String school_code)async{
    NoticeSaveReqDto saveReqDto = NoticeSaveReqDto(title, content, username, school_code);
    Response response = await _NoticeProvider.Noticesave(saveReqDto.toJson());
    dynamic body = response.body;
    print(body);
    // dynamic convertBody = convertUtf8ToObject(body);
    CMRespDto cmRespDto = CMRespDto.fromJson(body);

    if(cmRespDto.code == 1){
      print("공지사항등록 성공");
      Post post = Post.fromJson(cmRespDto.data);
      return post;
    }else {
      print("공지사항등록 실패");
      return Post();
    }
  }

}