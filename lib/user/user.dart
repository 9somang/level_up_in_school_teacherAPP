

class User{
  final int? id;
  final String? user_id;
  final String? username;
  final String? password;
  final String? email;


  User(
      {
      this.id,
      this.user_id,
      this.username,
      this.password,
      this.email,
      });


    User.fromJson(Map<String, dynamic>json)  //외부에서온 데이터를 다트오브젝트로변경
    :
      id = json['id'],
      username = json['username'],
      user_id = json['user_id'],
      password = json['password'],
      email = json['email'];

}
