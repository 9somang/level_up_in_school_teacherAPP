
import '../../user/user.dart';

class userPost {
  final int? id;
  final String? title;
  final String? discription;
  final int? exp;
  final int? point;
  final String? user_id;
  final String? pickedStdate;
  final String? pickedEnddate;
  final bool? done;
  final bool? check;

  userPost( {
    this.id,
    this.title,
    this.discription,
    this.exp,
    this.point,
    this.user_id,
    this.pickedStdate,
    this.pickedEnddate,
    this.done,
    this.check
  });


  userPost.fromJson(Map<String, dynamic> json) //외부에서온 데이터를 다트오브젝트로변경
      : id = json['id'],
        title = json['title'],
        discription = json['description'],
        exp = json['exp'],
        point = json['point'],
        user_id = json['user_id'],
        pickedStdate = json['start_date'],
        pickedEnddate = json['end_date'],
        done = json['done'],
        check = json['check'];
}
