
class NoticeSaveReqDto {
  final String? title;
  final String? content;
  final String? username;
  final String? school_code;

  NoticeSaveReqDto(this.title, this.content,this.username, this.school_code);

  Map<String, dynamic> toJson() => {
    "title": title,
    "content": content,
    "username": username,
    "school_code": school_code

  };
}
