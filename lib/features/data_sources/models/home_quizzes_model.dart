class HomeQuizzesModel {
  final int? id;
  final String? name;
  final String? description;
  final String? authorName;
  final double? rating;
  final int? questionCount;
  final int? maxTime;
  final int? solveCount;
  final String? image;
  final DateTime? createdOn;

  HomeQuizzesModel({
    this.id,
    this.name,
    this.description,
    this.authorName,
    this.rating,
    this.questionCount,
    this.maxTime,
    this.solveCount,
    this.image,
    this.createdOn,
  });

  factory HomeQuizzesModel.fromJson(Map<String, dynamic> json) =>
      HomeQuizzesModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        authorName: json['authorName'],
        rating: json['rating'],
        questionCount: json['questionCount'],
        maxTime: json['maxTime'],
        solveCount: json['solveCount'],
        image: json['image'],
        createdOn: json['createdOn'] != null ? DateTime.parse(json['createdOn']) : null,
      );
}
