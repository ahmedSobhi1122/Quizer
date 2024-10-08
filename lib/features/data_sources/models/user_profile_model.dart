import 'package:dio/dio.dart';
import 'package:quizer/core/constants/enum.dart';

class ProfileModel {
  final UserRole? type;
  final String? firstName;
  final String? lastName;
  final Rank? rank;
  final int? firstPlaceCount;
  final int? secondPlaceCount;
  final int? thirdPlaceCount;
  final String? description;
  final String? profileImage;
  final String? coverImage;
  final String? email;

  ProfileModel({
    this.email,
    this.type,
    this.firstName,
    this.lastName,
    this.rank,
    this.firstPlaceCount,
    this.secondPlaceCount,
    this.thirdPlaceCount,
    this.description,
    this.profileImage,
    this.coverImage,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
      type: json['userRole'] == null ? null : UserRole.values[json['userRole']],
      firstName: json['firstName'],
      lastName: json['lastName'],
      rank: json['rank'] == null ? null : Rank.values[json['rank']],
      firstPlaceCount: json['firstPlaceCount'],
      secondPlaceCount: json['secondPlaceCount'],
      thirdPlaceCount: json['thirdPlaceCount'],
      description: json['description'],
    profileImage: json['profileImage'],
      coverImage: json['coverImage'],
    );

  FormData toJson() => FormData.fromMap({'email': email});

}

