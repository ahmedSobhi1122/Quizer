import 'package:dio/dio.dart';
import 'package:quizer/core/constants/enum.dart';

class ProfileModel {
  final UserRole? userRole;
  final String? firstName;
  final String? id;
  final String? token;
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
    this.token,
    this.id,
    this.email,
    this.userRole,
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
        firstName: json['firstName'],
        lastName: json['lastName'],
        rank: json['rank'] == null ? null : getRankFromInt(json['rank']),
        firstPlaceCount: json['firstPlaceCount'],
        secondPlaceCount: json['secondPlaceCount'],
        thirdPlaceCount: json['thirdPlaceCount'],
        description: json['description'],
        profileImage: json['profileImage'],
        coverImage: json['coverImage'],
      );

  FormData toJson() => FormData.fromMap({'userID': id});
}

Rank getRankFromInt(int rank) {
  switch (rank) {
    case 0:
      return Rank.NEWBIE;
    case 1:
      return Rank.APPRENTICE;
    case 2:
      return Rank.CHALLENGER;
    case 3:
      return Rank.EXPERT;
    case 4:
      return Rank.MASTER_MIND;
    default:
      throw Exception('Invalid rank value');
  }
}
