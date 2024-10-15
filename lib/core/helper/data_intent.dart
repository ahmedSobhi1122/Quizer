import 'package:quizer/core/constants/enum.dart';
import 'package:quizer/features/domain/entities/user.dart';

class DataIntent {
  DataIntent._();

//------------------------------------
  //login to forget password
  static String? _email;

  static void pushEmail(String email) => _email = email;

  static String? popEmail() {
    String? value = _email;
    _email = null;
    return value;
  }
//------------------------------------

  //login data
  static User? _dataUser;

  static void pushDataUser(User dataUser) => _dataUser = dataUser;
  // static void editIdDataUser(int id) {
  //   _dataUser.id = id;
  // }
  // static void editTokenDataUser(String token) {
  //   _dataUser.token = token;
  // }
  static String? getIdUser() => _dataUser?.id;
  static String? getTokenUser() => _dataUser?.token;
  static UserRole? getUserRoleUser() => _dataUser?.userRole;

//------------------------------------
}
