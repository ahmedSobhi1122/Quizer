import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quizer/config/themes/theme.dart';
import 'package:quizer/core/helper/extensions.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/features/presentation/common/background.dart';
import 'package:quizer/features/presentation/common/image_upload.dart';
import 'package:quizer/features/presentation/pages/create%20question%20page/widgets/answer_list.dart';
import 'package:quizer/features/presentation/pages/create%20question%20page/widgets/question_button.dart';
import 'package:quizer/features/presentation/pages/create%20question%20page/widgets/question_field.dart';

import '../../../../config/routes/route_constants.dart';
import '../../common/button_back.dart';
import '../../common/custom_button_with_shadow.dart';
import '../../common/custom_progress.dart';

class CreateQuestionScreen extends StatefulWidget {
  @override
  State<CreateQuestionScreen> createState() => _CreateQuestionScreenState();
}

class _CreateQuestionScreenState extends State<CreateQuestionScreen> {

  final TextEditingController _questionController = TextEditingController();
  final TextEditingController _answerController = TextEditingController();
  final List<String> _answers = [];
  final int _maxAnswers = 4;
  Map<int, List<String>> _questionMap = {};
  int? _selectedAnswerIndex;
  int _questionIndex = 0;

  File? _image;
  final ImagePicker _picker = ImagePicker();

  void _addAnswer() {
    if (_answers.length < _maxAnswers &&
        _answerController.text.isNotEmpty &&
        !_answers.contains(_answerController.text)) {
      setState(() {
        _answers.add(_answerController.text);
        _answerController.clear();
      });
    }
  }

  void _selectAnswer(int index) {
    setState(() {
      _selectedAnswerIndex = index;
    });
  }

  void _addMore() {
    if (_questionController.text.isNotEmpty && _answers.isNotEmpty) {
      setState(() {
        _questionMap[_questionIndex] = List.from(_answers);
        _questionIndex++;
        _answers.clear();
        _questionController.clear();
      });
      context.message(message: 'Question saved! You can add a new one.');
    } else {
      context.message(
          message: 'Please enter a question and at least one answer.');
    }
  }

  void _onDismissAnswer(int index) {
    setState(() {
      _answers.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${_answers[index]} removed')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Background(
          paddingRight: AppSize.s10,
          paddingLeft: AppSize.s10,
          paddingTop: AppSize.s20,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CustomButtonBack(
                        onPressed: () => context.pushReplacementNamed(
                            Routes.quizSettingScreenRoute),
                      ),
                      SizedBox(width: AppSize.s28.w),
                      const CustomProgress(start: 0, end: 3),
                    ],
                  ),
                  Center(
                    child: Text(
                      "Question Data",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: AppSize.s22.sp,
                        color: MyTheme.textColor,
                      ),
                    ),
                  ),
                  SizedBox(height: AppSize.s40.h),
                  QuestionInputField(controller: _questionController),
                  SizedBox(height: AppSize.s20.h),
                  Container(
                    height: 100.h,
                    child: ImageUploadField(
                      hint: "Question image!",
                      fitter: BoxFit.cover,
                      onImageSelected: () async {
                        final pickedFile = await _picker.pickImage(
                            source: ImageSource.gallery);

                        if (pickedFile != null) {
                          setState(() {
                            _image = File(pickedFile.path);
                          });
                        }
                      },
                      image: _image,
                    ),
                  ),
                  SizedBox(height: AppSize.s20.h),
                  TextField(
                    controller: _answerController,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: MyTheme.textColor,
                      fontSize: AppSize.s16,
                    ),
                    decoration: InputDecoration(
                      labelText: "new answer",
                      labelStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: MyTheme.textColor,
                        fontSize: AppSize.s16,
                      ),
                      fillColor: Colors.white60,
                      suffixIcon: Icon(
                        Icons.title,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '${_answers.length}/$_maxAnswers',
                        style: TextStyle(
                          color: _answers.length >= _maxAnswers
                              ? Colors.red
                              : MyTheme.textColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  CustomButton(
                      text: "Add answer",
                      onPressed: () {
                        _addAnswer();
                      },
                      color: _answers.length >= _maxAnswers
                          ? Colors.grey
                          : MyTheme.primaryButtonColor,
                      colorText: MyTheme.primaryButtonTextColor),
                  SizedBox(height: AppSize.s20.h,),
                  if (_answers.isNotEmpty)
                    AnswerList(
                      answers: _answers,
                      onSelectAnswer: _selectAnswer,
                      onDismissAnswer: _onDismissAnswer,
                      selectedAnswerIndex: _selectedAnswerIndex,
                    ),
                  SizedBox(height: AppSize.s40.h),
                  QuestionButtons(
                    onAddMore: _addMore,
                    onFinish: () {

                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
