import 'package:dio/dio.dart';

class OTPProfileModel {
  final String? profileImage;
  final String? firstName;
  final String? lastName;
  final String? email;

  OTPProfileModel({
    this.email,
    this.profileImage,
    this.firstName,
    this.lastName,
  });

  factory OTPProfileModel.fromJson(Map<String, dynamic> json) => OTPProfileModel(
        firstName: json['firstName'],
        lastName: json['lastName'],
        profileImage: json['profileImage'],
      );

  FormData toJson() => FormData.fromMap({'email': email});
}
