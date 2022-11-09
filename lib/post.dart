
import '../user/user.dart';

class Post {
  final int? id;
  final String? title;
  final String? discription;
  final int? exp;
  final int? point;
  final String? class_code;
  final String? pickedStdate;
  final String? pickedEnddate;

  Post( {
    this.id,
    this.title,
    this.discription,
    this.exp,
    this.point,
    this.class_code,
    this.pickedStdate,
    this.pickedEnddate
  });


  Post.fromJson(Map<String, dynamic> json) //외부에서온 데이터를 다트오브젝트로변경
      : id = json['id'],
        title = json['title'],
        discription = json['description'],
        exp = json['exp'],
        point = json['point'],
        class_code = json['class_code'],
        pickedStdate = json['start_date'],
        pickedEnddate = json['end_date'];
}
