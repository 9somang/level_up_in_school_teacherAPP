
class NoticeSaveReqDto {
  final String? title;
  final String? content;
  final String? school_code;
  final String? create_date;

  NoticeSaveReqDto(this.title, this.content, this.school_code, this.create_date);

  Map<String, dynamic> toJson() => {
    "title": title,
    "content": content,
    "class_code": school_code,
    "current_date" : create_date

  };
}
