import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/core/resources/text_styles.dart';
import 'package:quizer/features/data_sources/models/answer_model.dart';
import '../../../../../config/routes/screen_export.dart';
import '../../../../../config/themes/theme.dart';
import '../../../../../core/resources/app_values.dart';

class CustomAnswersList extends StatefulWidget {
  final List<AnswerModel> answers;
  final String? selectedAnswer;
  final ValueChanged<String> onAnswerSelected;

  const CustomAnswersList(
      {super.key,
      required this.answers,
      required this.selectedAnswer,
      required this.onAnswerSelected});

  @override
  State<CustomAnswersList> createState() => _CustomAnswersListState();
}

class _CustomAnswersListState extends State<CustomAnswersList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: widget.answers.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: CustomAnswer(
            index: index,
            answer: widget.answers[index],
            onAnswerSelected: widget.onAnswerSelected,
            selectedAnswer: widget.selectedAnswer,
          ),
        );
      },
    );
  }
}

class CustomAnswer extends StatefulWidget {
  final int index;
  final AnswerModel answer;
  final String? selectedAnswer;
  final ValueChanged<String> onAnswerSelected;

  const CustomAnswer({
    super.key,
    required this.answer,
    required this.index,
    required this.selectedAnswer,
    required this.onAnswerSelected,
  });

  @override
  State<CustomAnswer> createState() => _CustomAnswerState();
}

class _CustomAnswerState extends State<CustomAnswer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.s60.h,
      decoration: BoxDecoration(
        color: MyTheme.answersCardColor,
        borderRadius: BorderRadius.circular(AppBorderRadius.br16),
      ),
      child: Padding(
        padding:
            EdgeInsets.only(left: AppPadding.p16.w, right: AppPadding.p8.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Display the answer content
            Text( widget.answer.content!,
              style: AppTextStyles.statQuizSubtitleSectionTextStyle(context),
              overflow: TextOverflow.ellipsis,
            ),
            // Radio button
            Radio<String>(
              value: widget.answer.content!,
              groupValue: widget.selectedAnswer,
              onChanged: (String? value) {
                widget.onAnswerSelected(value!);
              },
            ),
          ],
        ),
      ),
    );
  }
}
