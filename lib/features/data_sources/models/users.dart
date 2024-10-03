class UserModel {
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final DateTime? birthDate;
  final String email;
  final String password;

  UserModel({
    this.firstName,
      this.lastName,
      this.phoneNumber,
      this.birthDate,
      required this.email,
      required this.password
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        firstName: json['firstName'],
        lastName: json['lastName'],
        phoneNumber: json['phoneNumber'],
        birthDate: json['birthDate'] != null
            ? DateTime.parse(json['birthDate'])
            : null,
        email: json['email'],
        password: json['password']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'birthDate': birthDate?.toIso8601String(),
      'email': email,
      'password': password
    };
  }
}
