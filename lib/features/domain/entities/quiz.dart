import 'dart:io';

import 'package:quizer/features/data_sources/models/question_model.dart';

class Quiz {
  final int? id;
  final String? name;
  final String? description;
  final String? authorID;
  final String? authorName;
  final String? authorImage;
  final double? rating;
  final int? questionCount;
  final int? maxTime;
  final int? solveCount;
  final String? image;
  final File? imageFile;
  final DateTime? createdOn;
  final List<QuestionModel>? questions;

  Quiz({
    this.imageFile,
    this.id,
    this.name,
    this.description,
    this.authorID,
    this.authorName,
    this.authorImage,
    this.rating,
    this.questionCount,
    this.maxTime,
    this.solveCount,
    this.image,
    this.createdOn,
    this.questions,
  });
}
