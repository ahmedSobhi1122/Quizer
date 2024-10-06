class User {
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final DateTime? birthDate;
  final String? token;
  final String? imageUrl;
  final String? rank;
  final int? firstPlaceCount;
  final int? secondPlaceCount;
  final int? thirdPlaceCount;
  final String? description;
  final String? email;
  final String? password;

  User({
    this.firstPlaceCount,
    this.secondPlaceCount,
    this.thirdPlaceCount,
    this.description,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.birthDate,
    this.token,
    this.imageUrl,
    this.rank,
    this.email,
    this.password
  });
}
