import 'package:flutter/material.dart';
import 'package:quizer/config/themes/theme.dart';
import 'package:quizer/core/helper/extensions.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/core/resources/assets_manager.dart';
import 'package:quizer/features/presentation/common/background.dart';
import 'package:quizer/features/presentation/common/image_upload.dart';

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
        _questionMap[_questionIndex] =
            List.from(_answers);
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
                      onPressed: () => context
                          .pushReplacementNamed(Routes.quizSettingScreenRoute),
                    ),
                    SizedBox(
                      width: AppSize.s28.w,
                    ),
                    const CustomProgress(
                      start: 0,
                      end: 3,
                    ),
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
                SizedBox(
                  height: AppSize.s40.h,
                ),
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    // color: Colors.white60,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: TextField(
                    maxLength: 500,
                    controller: _questionController,
                    maxLines: null,
                    expands: true,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: MyTheme.textColor,
                      fontSize: AppSize.s20,
                    ),
                    decoration: const InputDecoration(
                      fillColor: Colors.white60,
                      hintText:
                          "Question description like\nWhat is your name ?",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: MyTheme.textColor,
                        fontSize: AppSize.s28,
                      ),
                      counterStyle: TextStyle(
                        color: MyTheme.textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: AppSize.s20,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppSize.s20.h,
                ),
                Container(
                  height: 100.h,
                  child: ImageUploadField(
                    hint: "Question image!",
                    fitter: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: AppSize.s20.h,
                ),
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
                          color: MyTheme.textColor, fontWeight: FontWeight.bold,fontSize: AppSize.s20),
                    ),
                  ],
                ),
                SizedBox(
                  height: AppSize.s20.h,
                ),
                CustomButton(
                  color: MyTheme.primaryButtonColor,
                  colorText: MyTheme.primaryButtonTextColor,
                  text: "Add answer",
                  onPressed: () {
                    _addAnswer();
                  },
                ),
                SizedBox(
                  height: AppSize.s20.h,
                ),
                SizedBox(
                  height: _answers.length * 65.h,
                  width: double.infinity,
                  child: Expanded(
                    child: ListView.builder(
                      physics: const ScrollPhysics(),
                      itemCount: _answers.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          key: Key(_answers[index]),
                          direction: DismissDirection.horizontal,
                          background: Container(
                            decoration: BoxDecoration(
                              color: Colors.red.withOpacity(.9),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child:
                                const Icon(Icons.delete, color: Colors.white),
                          ),
                          onDismissed: (direction) {
                            setState(() {
                              _answers.removeAt(index);
                            });

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text('${_answers[index]} removed')),
                            );
                          },
                          child: GestureDetector(
                            onTap: () => _selectAnswer(index),
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 4),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: _selectedAnswerIndex == index
                                    ? Colors.green[100]
                                    : Colors.grey[200],
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: _selectedAnswerIndex == index
                                      ? Colors.green
                                      : Colors.transparent,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    _answers[index],
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  Icon(
                                    _selectedAnswerIndex == index
                                        ? Icons.check_circle
                                        : Icons.circle,
                                    color: _selectedAnswerIndex == index
                                        ? Colors.green
                                        : Colors.grey,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Row(children: [
                  Expanded(
                    child: CustomButton(
                      text: "Add More",
                      onPressed: () {
                        _addMore();
                      },
                      color: MyTheme.secondaryButtonColor,
                      colorText: MyTheme.secondaryButtonTextColor,
                    ),
                  ),
                  SizedBox(
                    width: 50.w,
                  ),
                  Expanded(
                    child: CustomButton(
                      color: MyTheme.primaryButtonColor,
                      colorText: MyTheme.primaryButtonTextColor,
                      text: "Finish",
                      onPressed: () {},
                    ),
                  )
                ])
              ],
            ),
          )),
        ),
      ),
    );
  }
}
