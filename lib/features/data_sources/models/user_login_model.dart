import 'package:dio/dio.dart';
import 'package:quizer/core/constants/enum.dart';

class UserLoginModel {
  final String? email;
  final String? password;
  final String? token;
  final String? id;
  final UserRole? userRole;


  UserLoginModel({
    this.id,
    this.userRole,
    this.token,
    this.email,
    this.password
  });

  factory UserLoginModel.fromJson(Map<String, dynamic> json) {
    return UserLoginModel(
      token: json['token'],
      userRole: json['userRole'],
      id: json['id'],
    );
  }

  FormData toJson() {
    return FormData.fromMap({
      'email': email,
      'password': password,
    });
  }
}
