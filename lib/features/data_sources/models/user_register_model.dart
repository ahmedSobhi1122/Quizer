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
      token: json['token'],
      userRole: getUserRoleFromInt(json['userRole']),
      id: json['id'],
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

UserRole getUserRoleFromInt(int userRole) {
  switch (userRole) {
    case 0:
      return UserRole.ADMIN;
    case 1:
      return UserRole.STUDENT;
    case 2:
      return UserRole.TEACHER;
    default:
      throw Exception('Invalid rank value');
  }
}