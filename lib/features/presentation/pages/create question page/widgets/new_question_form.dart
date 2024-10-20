import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quizer/config/themes/theme.dart';
import 'package:quizer/core/helper/data_intent.dart';
import 'package:quizer/core/helper/extensions.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/features/data_sources/models/answer_model.dart';
import 'package:quizer/features/data_sources/models/question_model.dart';
import 'package:quizer/features/data_sources/models/quiz_model.dart';
import 'package:quizer/features/presentation/common/custom_button_with_shadow.dart';
import 'package:quizer/features/presentation/common/image_upload.dart';
import 'package:quizer/features/presentation/cubit/create_question_answers_cubit.dart';
import 'package:quizer/features/presentation/cubit/question_create_cubit.dart';
import 'package:quizer/features/presentation/cubit/upload_image_cubit.dart';
import 'package:quizer/features/presentation/pages/create%20question%20page/widgets/answer_list.dart';
import 'package:quizer/features/presentation/pages/create%20question%20page/widgets/question_button.dart';
import 'package:quizer/features/presentation/pages/create%20question%20page/widgets/question_field.dart';
import 'package:quizer/features/presentation/state/create_question_answers_state.dart';
import 'package:quizer/features/presentation/state/question_create_state.dart';
import 'package:quizer/features/presentation/state/upload_image_state.dart';


class NewQuestionForm extends StatelessWidget {


  final TextEditingController questionController;
  final TextEditingController answerController;

  final ImagePicker _picker = ImagePicker();
  File? _image;

  List<String> answers = [];
  List<AnswerModel> savedAnswers = [];
  final int _maxAnswers = 4;
  int? selectedAnswerIndex;


  NewQuestionForm({super.key,
    required this.questionController,
    required this.answerController,

  });

  @override
  Widget build(BuildContext context) {







    return   SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppPadding.p8.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Enter Question Data Below",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: AppSize.s22.sp,
                    color: MyTheme.textColor,
                  ),
                ),
              ),
              SizedBox(height: AppSize.s40.h),












              QuestionInputField(controller: questionController), /// TODO question Title Here





              SizedBox(height: AppSize.s20.h),
              BlocBuilder<UploadImageCubit, UploadImageState>(builder: (context, state)
              {
                return SizedBox(
                  height: 100.h,
                  child: ImageUploadField(
                    hint: "Question image!",
                    fitter: BoxFit.cover,
                    onImageSelected: () async {
                      var pickedFile = await context.read<UploadImageCubit>().upload();
                      if (pickedFile != null) {
                        _image = File(pickedFile.path);
                      }
                    },
                    image: _image,
                  ),
                ); /// TODO Image Here
              }),










              SizedBox(height: AppSize.s20.h),
              TextField(
                controller: answerController,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: MyTheme.reverseColor,
                  fontSize: AppSize.s16,
                ),
                decoration: InputDecoration(
                  labelText: "Add new answer here",
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: MyTheme.primaryButtonColor,
                    fontSize: AppSize.s18,
                  ),
                  suffixIcon: Icon(Icons.title, color: Colors.grey[700]),
                ),
              ), /// TODO answer Content Here







              BlocBuilder<CreateQuestionAnswersCubit, CreateQuestionAnswersState>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '${answers.length}/$_maxAnswers',
                        style: TextStyle(
                          color: answers.length >= _maxAnswers
                              ? Colors.red
                              : MyTheme.textColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  );
                }
              ), /// TODO answer Limit Here

              BlocBuilder<CreateQuestionAnswersCubit, CreateQuestionAnswersState>(
                builder: (context, state) {

                  return CustomButton(text: "Add Answer",
                      onPressed: ()
                      {
                        context.read<CreateQuestionAnswersCubit>().editAnswer();
                        if(answers.length >= _maxAnswers)
                          {
                            context.message(message: "Max Number of answers is 4 ");
                          }
                        else if(answers.contains(answerController.text))
                          {
                            context.message(message: "Answer Already Added");
                          }
                        else if (answerController.text.isNullOrEmpty())
                          {
                            context.message(message: "Please add answer value first");
                          }
                        else
                          {
                            answers.add(answerController.text);
                            answerController.clear();
                          }

                        context.read<CreateQuestionAnswersCubit>().editAnswer();
                      },
                      color: answers.length == _maxAnswers ? MyTheme.disabledColor : MyTheme.primaryButtonColor,
                      colorText: MyTheme.primaryButtonTextColor);
                }
              ),






            BlocBuilder<CreateQuestionAnswersCubit, CreateQuestionAnswersState>(builder: (context, state)
            {
              if (answers.isNotEmpty) {
                return AnswerList(
                  answers: answers,
                  onSelectAnswer: (trueAnswerIndex)
                  {
                    selectedAnswerIndex = trueAnswerIndex;
                    context.read<CreateQuestionAnswersCubit>().editAnswer();
                  },
                  onDismissAnswer: (dismissIndex)
                  {
                    answers.removeAt(dismissIndex);
                    context.read<CreateQuestionAnswersCubit>().editAnswer();
                  },
                  selectedAnswerIndex: selectedAnswerIndex,
                );  /// TODO answers List Here
              }
              else{
                return const SizedBox.shrink();
              }
            }),






              SizedBox(height: AppSize.s40.h),
              BlocBuilder<QuestionCubit, QuestionCreateState>( // TODO should be same cubit as PageView
                  builder: (context, state) {
                    return QuestionButtons(
                      onAddMore: () {
                        for(String answer in answers)
                        {
                          if(answers[selectedAnswerIndex!] == answer)
                            {
                              savedAnswers.add(AnswerModel(
                                isRightAnswer: true,
                                content: answer
                              ));
                            }
                          else
                            {
                              savedAnswers.add(AnswerModel(
                                  isRightAnswer: false,
                                  content: answer
                              ));
                            }
                        }

                        QuestionModel question = QuestionModel(
                          title: questionController.text,
                          imageFile: _image,
                          answers: savedAnswers,
                        );
                        context.read<QuestionCubit>().addQuestion(question);
                      },
                      onFinish:  () async
                      {
                        var data = DataIntent.getQuizModel();
                        QuizModel quizModel = QuizModel(
                          imageFile: data!.imageFile,
                          description: data.description,
                          name:  data.name,
                          maxTime: data.maxTime,
                          questions: context.read<QuestionCubit>().questions,
                          questionCount: context.read<QuestionCubit>().questionCount(),
                          authorID: "515f1d2d-ec77-4dac-9408-7c0a982ccf50"

                        );
                        await context.read<QuestionCubit>().sendRequest("eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJnaXZlbl9uYW1lIjoiemVpYWQiLCJmYW1pbHlfbmFtZSI6Im1vaGFtbWVkIiwiZW1haWwiOiJ6YXphb3NrYXI5MjhAZ21haWwuY29tIiwibmJmIjoxNzI5MzEyNDc0LCJleHAiOjE3MzE5OTQ0NzQsImlhdCI6MTcyOTMxMjQ3NCwiaXNzIjoiaHR0cDovL2xvY2FsaG9zdDo1MjI2IiwiYXVkIjoiaHR0cDovL2xvY2FsaG9zdDo1MjI2In0._2CCJcmvr5g9X9ar1dwuOvnp4--KvzEC5HkfgI8P4qQ5z84Ry0Ibcg_VetSklG59F8mq4prBatHWUtUSNgcsgg",
                            quizModel);
                      },
                    );
                  }),
            ],
          ),
        ),
      );
    }
  }
