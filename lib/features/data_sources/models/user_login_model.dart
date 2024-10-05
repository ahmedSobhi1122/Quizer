import 'package:dio/dio.dart';

class UserLoginModel {
  final String? email;
  final String? password;
  final String? token;

  UserLoginModel({
    this.token,
    this.email,
    this.password
  });

  factory UserLoginModel.fromJson(Map<String, dynamic> json) {
    return UserLoginModel(
        email: json['email'],
        password: json['password']
    );
  }

  FormData toJson() {
    return FormData.fromMap({
      'email': email,
      'password': password,
    });
  }
}
