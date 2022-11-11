import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../model/Ntp.dart';
import '../model/post.dart';
import 'NoticeRepository.dart';

class NoticeController extends GetxController {
  final NoticeRepository _NoticeRepository = NoticeRepository();
  final posts = <NTP>[].obs;
  final post = NTP().obs;
  var create_date = DateTime.now();

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> findAllNoticelist() async {
    List<NTP> posts = await _NoticeRepository.findAllNoticelist();
    this.posts.value = posts;
    print("${posts}");
  }

  Future<void> findByNoticeId(int id) async {
    NTP post = await _NoticeRepository.findByNoticeId(id);
    this.post.value = post;
  }

  Future<void> Noticesave(String title, String content, String class_code, String create_date)async{
    NTP post = await _NoticeRepository.Noticesave(title,content, class_code , create_date);
    if(post.id != null){
      posts.add(post);
    }
  }

  Future<void> deleteByNoticeId(int id) async{
    int result = await _NoticeRepository.deleteByNoticeId(id);

    if(result == 1){
      print("DB 삭제 성공");
      List<NTP> result = posts.where((post) => post.id != id).toList();
      // print(result.length);  // DB 길이값 체크
      posts.value = result;
    }
  }

  Future<void> Noticeupdate(int id, String title, String content,String class_code, String create_date) async{
    NTP post = await _NoticeRepository.Noticeupdate(id,title,content,class_code,create_date);
    if(post.id != null) {
      this.post.value = post;
      posts.value = this.posts.map((e) => e.id == id ? post : e).toList();
    }
  }

}