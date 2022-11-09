class LoginReqDto {
  final String? userid;
  final String? password;

  LoginReqDto(this.userid, this.password);

  Map<String, dynamic> toJson() => {
    "user_id": userid,
    "password": password,
  };
}
