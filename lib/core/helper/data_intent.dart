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
  // login-register to All Screens
  static String? _userID;
  static UserRole? _userRole;
  static String? _token;

  static void pushUserID(String userID) {
    _userID = userID;
  }
  static void pushUserRole(UserRole userRole) {
    _userRole = userRole;
  }
  static void pushToken(String token) {
    _token = token;
  }

  static String? getUserID() {
    return _userID;
  }
  static UserRole? getUserRole() {
    return _userRole;
  }
  static String? getToken() {
    return _token;
  }



}
