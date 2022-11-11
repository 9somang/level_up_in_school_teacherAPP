
import 'package:admin/userQuest/userquestRepository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../model/post.dart';
import '../model/userPost.dart';

class userQuestController extends GetxController {
  final userQuestRepository _userQuestRepository = userQuestRepository();
  final posts = <userPost>[].obs;
  final post = userPost().obs;

  @override
  void onInit() {
    super.onInit();
    findAllUserQuestlist();
  }

  Future<void> findAllUserQuestlist() async {
    List<userPost> posts = await _userQuestRepository.findAllQuestlist();
    this.posts.value = posts;
    print("$posts");
  }

  Future<void> findByUserQuestId(int id) async {
    userPost userpost = await _userQuestRepository.findByQuestId(id);
    this.post.value = userpost;
  }


  // Future<void> deleteByQuestId(int id) async{
  //   int result = await _QuestRepository.deleteByQuestId(id);
  //
  //   if(result == 1){
  //     print("DB 삭제 성공");
  //     List<Post> result = posts.where((post) => post.id != id).toList();
  //     // print(result.length);  // DB 길이값 체크
  //     posts.value = result;
  //   }
  // }
  //
  Future<void> QuestCheck(int id) async{
    userPost post = await _userQuestRepository.Questcheck(id);
  }

}