import 'package:dio/dio.dart';
import 'package:quizer/core/constants/enum.dart';

class UserRegisterModel {
  final UserRole? userRole;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final DateTime? birthDate;
  final String? email;
  final String? password;
  final String? token;
  final String? id;

  UserRegisterModel({
    this.id,
    this.userRole,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.birthDate,
    this.email,
    this.password,
    this.token,
  });

  factory UserRegisterModel.fromJson(Map<String, dynamic> json) {
    return UserRegisterModel(
      userRole: json['type'] != null ? UserRole.values[json['type']] : null,
      firstName: json['firstName'],
      lastName: json['lastName'],
      phoneNumber: json['phoneNumber'],
      birthDate:
          json['birthDate'] != null ? DateTime.parse(json['birthDate']) : null,
      email: json['email'],
      password: json['password'],
    );
  }

  FormData toJson() {
    return FormData.fromMap({
      'userRole': userRole?.index,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'birthDate': birthDate?.toIso8601String(),
      'email': email,
      'password': password,
    });
  }
}
