import 'dart:io';

import 'package:quizer/core/constants/enum.dart';
import 'package:quizer/features/data_sources/models/answer_model.dart';

class QuestionModel {
  final int? id;
  final String? title;
  final String? image;
  final File? imageFile;
  final QuestionTypeModel? type;
  final List<AnswerModel>? answers;

  QuestionModel({
    this.imageFile,
    this.id,
    this.title,
    this.image,
    this.type,
    this.answers,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
        id: json['id'],
        title: json['title'],
        image: json['image'],
        answers: json['answers'] != null
            ? (json['answers'] as List)
                .map((answer) => AnswerModel.fromJson(answer))
                .toList()
            : const [],
      );
}
