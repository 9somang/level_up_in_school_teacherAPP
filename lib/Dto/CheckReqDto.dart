import 'package:admin/user/user_controller.dart';
import 'package:intl/intl.dart';


class CheckReqDto {
  final String? user_id;
  // user id


  CheckReqDto(
      this.user_id
      );

  Map<String, dynamic> toJson() => {
    "user_id" : user_id
  };
}