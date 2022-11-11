
import '../../user/user.dart';

class NTP {
  final int? id;
  final String? title;
  final String? content;
  final String? class_code;


  NTP( {
    this.id,
    this.title,
    this.content,
    this.class_code,

  });


  NTP.fromJson(Map<String, dynamic> json) //외부에서온 데이터를 다트오브젝트로변경
      : id = json['id'],
        title = json['title'],
        content = json['content'],
        class_code = json['class_code'];
}
