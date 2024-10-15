import 'package:quizer/core/constants/enum.dart';

class User {
  final UserRole? type;
  final Rank? rank;
  final String? token;
  final String? email;
  final String? password;
  final String? lastName;
  final String? firstName;
  final String? coverImage;
  final String? description;
  final DateTime? birthDate;
  final String? phoneNumber;
  final int? firstPlaceCount;
  final int? thirdPlaceCount;
  final String? profileImage;
  final int? secondPlaceCount;
  final int? points;

  User({
    this.type,
    this.coverImage,
    this.profileImage,
    this.points,
    this.firstPlaceCount,
    this.secondPlaceCount,
    this.thirdPlaceCount,
    this.description,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.birthDate,
    this.token,
    this.rank,
    this.email,
    this.password,
  });
}
