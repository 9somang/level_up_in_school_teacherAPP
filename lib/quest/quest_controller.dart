
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../model/post.dart';
import 'QuestRepository.dart';

class QuestController extends GetxController {
  final QuestRepository _QuestRepository = QuestRepository();
  final posts = <Post>[].obs;
  final post = Post().obs;
  var selectedStDate = DateTime.now().obs;
  var selectedEndDate = DateTime.now().obs;

  @override
  void onInit() {
    super.onInit();
    findAllQuestlist();
  }

  Future<void> findAllQuestlist() async {
    List<Post> posts = await _QuestRepository.findAllQuestlist();
    this.posts.value = posts;
    print("${posts}");
  }

  Future<void> findByQuestId(int id) async {
    Post post = await _QuestRepository.findByQuestId(id);
    this.post.value = post;
  }

  //String pickedStDate, String pickedenddate pickedStDate,pickedenddate
  Future<void> Questsave(String title, String discription, int exp, int point,String class_code, DateTime pickedStdate, DateTime pickedEnddate)async{
    Post post = await _QuestRepository.Questsave(title,discription, exp,point,class_code, pickedStdate, pickedEnddate);
    if(post.id != null){
      posts.add(post);
    }
  }

  Future<void> deleteByQuestId(int id) async{
    int result = await _QuestRepository.deleteByQuestId(id);

    if(result == 1){
      print("DB 삭제 성공");
      List<Post> result = posts.where((post) => post.id != id).toList();
      // print(result.length);  // DB 길이값 체크
      posts.value = result;
    }
  }

  Future<void> Questupdate(int id, String title, String discription, int exp, int point,String class_code, DateTime pickedStdate, DateTime pickedEnddate) async{
    Post post = await _QuestRepository.Questupdate(id,title,discription, exp,point,class_code, pickedStdate, pickedEnddate);
    if(post.id != null) {
      this.post.value = post;
      posts.value = this.posts.map((e) => e.id == id ? post : e).toList();
    }
  }




  chooseStDate() async {
    DateTime? pickedStDate = await showDatePicker(
      context: Get.context!,
      initialDate: selectedStDate.value,
      firstDate: DateTime(DateTime.now().year -3),
      lastDate:DateTime(DateTime.now().year +3),
      cancelText: 'Close',
    );

    if(pickedStDate != null && pickedStDate != selectedStDate.value){
      selectedStDate.value = pickedStDate;
      DateFormat('yyyy-MM-dd').format(pickedStDate);
      print('테스트: ${pickedStDate}');
    }

  }

  chooseEndDate() async {
    DateTime? pickedEndDate = await showDatePicker(
      context: Get.context!,
      initialDate: selectedEndDate.value,
      firstDate: DateTime(DateTime.now().year -3),
      lastDate:DateTime(DateTime.now().year +3),
      cancelText: 'Close',
    );

    if(pickedEndDate != null && pickedEndDate != selectedEndDate.value){
      selectedEndDate.value = pickedEndDate;
      print('테스트2: ${pickedEndDate}');
    }

  }

}