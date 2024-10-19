import 'dart:io';

import 'package:dio/dio.dart';
import 'package:quizer/features/data_sources/models/question_model.dart';

class QuizModel {
  final int? id;
  final String? authorID;
  final String? name;
  final String? description;
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

  QuizModel({
    this.id,
    this.authorID,
    this.name,
    this.description,
    this.authorName,
    this.authorImage,
    this.rating,
    this.questionCount,
    this.maxTime,
    this.solveCount,
    this.image,
    this.createdOn,
    this.questions,
    this.imageFile,
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        authorName: json['authorName'],
        authorImage: json['authorImage'],
        rating: json['rating'],
        questionCount: json['questionCount'],
        maxTime: json['maxTime'],
        solveCount: json['SolveCount'],
        image: json['image'],
        createdOn: json['createdOn'] != null
            ? DateTime.parse(json['createdOn'])
            : null,
        questions: json['questions'] != null
            ? (json['questions'] as List)
                .map((question) => QuestionModel.fromJson(question))
                .toList()
            : const [],
      );

  Future<FormData> toJson() async => FormData.fromMap({
        'name': name,
        'description': description,
        'questionCount': questionCount,
        'maxTime': maxTime,
        'image': (imageFile != null)
            ? await MultipartFile.fromFile(imageFile!.path,
                filename: imageFile!.path.split('/').last)
            : null,
        'questions': questions?.map(
          (question) async => {
            'title': question.title,
            'image': (question.imageFile != null)
                ? await MultipartFile.fromFile(question.imageFile!.path,
                    filename: question.imageFile!.path.split('/').last)
                : null,
            'answers': question.answers?.map(
              (answer) => {
                'content': answer.content,
                'isRightAnswer': answer.isRightAnswer,
              },
            ) as List?,
          },
        ) as List?,
      });
}
