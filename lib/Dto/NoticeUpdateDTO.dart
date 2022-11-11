import 'package:intl/intl.dart';

class NoticeUpdateReqDto {
  final String? title;
  final String? content;
  final String? class_code;
  final String? create_date;

  NoticeUpdateReqDto(this.title, this.content ,this.class_code, this.create_date);

  Map<String, dynamic> toJson() => {
    "title": title,
    "content": content,
    "class_code":class_code,
    "current_date" : create_date
  };
}