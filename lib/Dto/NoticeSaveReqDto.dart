
class NoticeSaveReqDto {
  final String? title;
  final String? content;
  final String? school_code;

  NoticeSaveReqDto(this.title, this.content, this.school_code);

  Map<String, dynamic> toJson() => {
    "title": title,
    "content": content,
    "school_code": school_code

  };
}
