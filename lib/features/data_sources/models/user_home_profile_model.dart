import 'package:dio/dio.dart';
import 'package:quizer/core/constants/enum.dart';

class HomeProfileModel {
  final String? userID;
  final String? firstName;
  final String? lastName;
  final Rank? rank;
  final int? points;
  final String? profileImage;

  HomeProfileModel({
    this.userID,
    this.firstName,
    this.lastName,
    this.rank,
    this.points,
    this.profileImage,
  });

  factory HomeProfileModel.fromJson(Map<String, dynamic> json) => HomeProfileModel(
    firstName: json['firstName'],
    lastName: json['lastName'],
    rank: getRankFromInt(json['rank']),
    points: json['points'],
    profileImage: json['profileImage'],
  );

  FormData toJson() => FormData.fromMap({'userID': userID});

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
