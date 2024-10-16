class Quiz {
  final int? id;
  final String? name;
  final String? description;
  final String? madeBy;
  final double? rating;
  final int? questionCount;
  final int? maxTime;
  final int? solveCount;
  final String? image;
  final DateTime? createdOn;

  Quiz({
    this.id,
    this.name,
    this.description,
    this.madeBy,
    this.rating,
    this.questionCount,
    this.maxTime,
    this.solveCount,
    this.image,
    required this.createdOn,
  });
}