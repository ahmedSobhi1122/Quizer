import 'dart:io';

import 'package:quizer/features/data_sources/models/answer_model.dart';

import '../../../core/constants/enum.dart';

class QuestionModel {
  final int? id;
  final String? title;
  final String? image;
  final File? imageFile;
  final QuestionTypeModel? type;
  final List<AnswerModel>? answers;
  final bool? trueFalseCorrectAnswer;

  QuestionModel({this.imageFile,
      this.id,
      this.title,
      this.image,
      this.type,
      this.answers,
      this.trueFalseCorrectAnswer});

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
        id: json['id'],
        title: json['title'],
        image: json['image'],
        type: json['type'],
        answers: json['answers'] != null
            ? json['answers'].map((answer) => AnswerModel.fromJson(answer))
            : const [],
        trueFalseCorrectAnswer: json['trueFalseCorrectAnswer'],
      );
}
