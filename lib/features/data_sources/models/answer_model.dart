class AnswerModel {
  final int? id;
  final String? content;
  final bool? isRightAnswer;

  AnswerModel({
    this.id, this.content, this.isRightAnswer
  });

  factory AnswerModel.fromJson(Map<String, dynamic> json) =>
      AnswerModel(
        id: json['id'],
        content: json['content'],
        isRightAnswer: json['isRightAnswer'],
      );
}
