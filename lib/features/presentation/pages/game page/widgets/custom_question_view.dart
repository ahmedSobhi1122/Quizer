import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/core/constants/constants.dart';
import 'package:quizer/core/helper/extensions.dart';
import 'package:quizer/features/data_sources/models/question_model.dart';

import '../../../../../config/routes/screen_export.dart';
import '../../../../../core/helper/image_handler.dart';
import '../../../../../core/resources/app_values.dart';
import '../../../../../core/resources/text_styles.dart';
import 'custom_answers_list.dart';

class CustomQuestionView extends StatelessWidget {
  final QuestionModel question;
  final String? selectedAnswer;
  final ValueChanged<String> onAnswerSelected;

  const CustomQuestionView({
    super.key,
    required this.question,
    required this.selectedAnswer,
    required this.onAnswerSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: AppSize.s66.h,
        ),
        Text( question.title!,
          style: AppTextStyles.gameQuestionTitleTextStyle(context),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: AppSize.s36.h,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(AppBorderRadius.br16),
          child: ImageManager(
            height: AppSize.s250.h,
            width: context.width,
            url: Constants.url + question.image!,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: AppSize.s36.h,
        ),
        CustomAnswersList(answers: question.answers!, selectedAnswer: selectedAnswer, onAnswerSelected: onAnswerSelected),
      ],
    );
  }
}