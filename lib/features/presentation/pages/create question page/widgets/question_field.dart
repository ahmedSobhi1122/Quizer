import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/routes/screen_export.dart';
import '../../../../../config/themes/theme.dart';
import '../../../../../core/resources/app_values.dart';

class QuestionInputField extends StatelessWidget {
  final TextEditingController controller;

  const QuestionInputField({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: TextField(
        maxLength: 500,
        controller: controller,
        maxLines: null,
        expands: true,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: MyTheme.textColor,
          fontSize: AppSize.s20,
        ),
        decoration: const InputDecoration(
          fillColor: Colors.white60,
          hintText: "Question description like\nWhat is your name?",
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
    );
  }
}
