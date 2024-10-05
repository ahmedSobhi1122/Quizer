import 'package:dio/dio.dart';

class UserRegisterModel {
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final DateTime? birthDate;
  final String? email;
  final String? password;
  final String? token;


  UserRegisterModel({
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.birthDate,
    this.email,
    this.password,
    this.token
  });

  factory UserRegisterModel.fromJson(Map<String, dynamic> json) {
    return UserRegisterModel(
        firstName: json['firstName'],
        lastName: json['lastName'],
        phoneNumber: json['phoneNumber'],
        birthDate: json['birthDate'] != null
            ? DateTime.parse(json['birthDate'])
            : null,
        email: json['email'],
        password: json['password']);
  }

  FormData toJson() {
    return FormData.fromMap({
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'birthDate': birthDate?.toIso8601String(),
      'email': email,
      'password': password
    });
  }
}
