class User {
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final DateTime? birthDate;
  final String email;
  final String password;

  User({
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.birthDate,
    required this.email,
    required this.password
  });
}
