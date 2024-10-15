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
        email: json['email'],
        password: json['password'],
        token: json['token'],
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
