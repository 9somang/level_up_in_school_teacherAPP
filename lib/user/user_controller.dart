import 'package:admin/user/user.dart';
import 'package:admin/user/user_repository.dart';
import 'package:get/get.dart';
import '../Token/token.dart';


class UserController extends GetxController {
  final UserRepository _userRepository = UserRepository();
  final RxBool isLogin = false.obs; // UI가 관찰가능한 변수 => 변경 => UI가 자동업데이트
  final principal = User().obs;

  Future<void> register(String username, String user_id, String password ,String school_code,String class_code, String email)async{
    await _userRepository.register( username, user_id,password ,school_code ,class_code, email);
  }


  Future<int> login(String user_id, String password) async {
    User principal = await _userRepository.login(user_id, password);
    print(principal.user_id);
    if (principal.user_id != null) {
      isLogin.value = true;
      this.principal.value = principal;
      return 1;
    } else {
      return -1;
    }
  }

  void logout() {
    isLogin.value = false;
    jwtToken = null;
  }
}
