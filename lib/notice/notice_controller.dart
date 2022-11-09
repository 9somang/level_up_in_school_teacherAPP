import 'package:get/get.dart';
import '../post.dart';
import 'NoticeRepository.dart';

class NoticeController extends GetxController {
  final NoticeRepository _NoticeRepository = NoticeRepository();
  final posts = <Post>[].obs;
  final post = Post().obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> Noticesave(String title, String content,username, String school_code)async{
    Post post = await _NoticeRepository.Noticesave(title,content,username, school_code);
    if(post.id != null){
      posts.add(post);
    }
  }

  // Future<void> deleteNotice(int id) async{
  //   int result = await _NoticeRepository.deleteByJobnoId(id);
  //
  //   if(result == 1){
  //     print("DB 삭제 성공");
  //     List<Post> result = posts.where((post) => post.id != id).toList();
  //     // print(result.length);  // DB 길이값 체크
  //     posts.value = result;
  //   }
  // }
  //
  // Future<void> findAllJobnotice() async {
  //   List<Post> posts = await _NoticeRepository.findAllJobNotice();
  //   this.posts.value = posts;
  // }

}