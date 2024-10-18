class LeaderBoardModel {
  final String? userID;
  final String? profileImage;
  final String? firstName;
  final String? lastName;
  final int? points;

  LeaderBoardModel({
    this.userID,
    this.points,
    this.firstName,
    this.lastName,
    this.profileImage,
  });

  factory LeaderBoardModel.fromJson(Map<String, dynamic> json) =>
      LeaderBoardModel(
        userID: json["userID"],
        points: json["points"],
        profileImage: json["profileImage"],
        firstName: json["firstName"],
        lastName: json["lastName"],
      );
}
