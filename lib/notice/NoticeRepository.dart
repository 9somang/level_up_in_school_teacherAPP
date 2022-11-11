
import 'package:admin/model/Ntp.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import '../Dto/CMRespDto.dart';
import '../Dto/NoticeSaveReqDto.dart';
import '../Dto/NoticeUpdateDTO.dart';
import '../model/post.dart';
import 'Notice_provider.dart';

class NoticeRepository {
  final NoticeProvider _NoticeProvider = NoticeProvider();

  Future<List<NTP>> findAllNoticelist() async {
    Response response = await _NoticeProvider.findAllNoticelist();
    dynamic body = response.body;
    CMRespDto cmRespDto = CMRespDto.fromJson(body);
    if (cmRespDto.code == 1) {
      List<dynamic> temp = cmRespDto.data;
      List<NTP> posts = temp.map((post) => NTP.fromJson(post)).toList();
      return posts;
    } else {
      return <NTP>[]; // 빈배열 호출
    }
  }

  Future<NTP> findByNoticeId(int id) async{
    Response response = await _NoticeProvider.findByNoticeId(id);
    dynamic body = response.body;
    print("${body}");
    // dynamic convertBody = convertUtf8ToObject(body);
    CMRespDto cmRespDto = CMRespDto.fromJson(body);

    if(cmRespDto.code == 1) {
      NTP post = NTP.fromJson(cmRespDto.data);
      return post;
    }else {
      return  NTP();
    }
  }

  Future<NTP> Noticesave(String title, String content, String class_code , String create_date)async{
    NoticeSaveReqDto saveReqDto = NoticeSaveReqDto(title, content, class_code, create_date);
    Response response = await _NoticeProvider.Noticesave(saveReqDto.toJson());
    dynamic body = response.body;
    print(body);
    // dynamic convertBody = convertUtf8ToObject(body);
    CMRespDto cmRespDto = CMRespDto.fromJson(body);

    if(cmRespDto.code == 1){
      print("공지사항등록 성공");
      NTP post = NTP.fromJson(cmRespDto.data);
      return post;
    }else {
      print("공지사항등록 실패");
      return NTP();
    }
  }

  Future<int> deleteByNoticeId(int id) async{
    Response response = await _NoticeProvider.deleteByNoticeId(id);
    dynamic body = response.body;
    CMRespDto cmRespDto = CMRespDto.fromJson(body);

    return cmRespDto.code ?? -1;  // 또는 code!;
  }

  Future<NTP> Noticeupdate(int id, String title, String content ,String class_code, String create_date)async{
    NoticeUpdateReqDto noticeupdateReqDto = NoticeUpdateReqDto(title, content ,class_code,create_date);
    Response response = await _NoticeProvider.Noticeupdate(id, noticeupdateReqDto.toJson());
    dynamic body = response.body;
    print("${body}");
    // dynamic convertBody = convertUtf8ToObject(body);
    CMRespDto cmRespDto = CMRespDto.fromJson(body);
    print("데이터 : ${cmRespDto.data}");

    if(cmRespDto.code == 1){
      print("수정성공");
      NTP post = NTP.fromJson(cmRespDto.data);
      return post;
    }else {
      print("수정실패");
      return NTP();
    }
  }

}