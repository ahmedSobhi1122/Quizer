import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizer/features/presentation/cubit/game_cubit.dart';
import '../../../../../config/routes/screen_export.dart';
import '../../../../../config/themes/theme.dart';
import '../../../../../core/resources/app_values.dart';
import '../../../common/custom_button_with_shadow.dart';

class CustomBottomNavigation extends StatelessWidget {
  final PageController pageController; // Add PageController
  final int totalQuestions; // Add total number of questions

  const CustomBottomNavigation({
    Key? key,
    required this.pageController, // Require PageController in the constructor
    required this.totalQuestions, // Require total number of questions
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: AppPadding.p20.h,
        left: AppPadding.p24.w,
        right: AppPadding.p24.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButton(
              width: 150,
              text: "Previous",
              colorText: MyTheme.secondaryButtonTextColor,
              color: MyTheme.secondaryButtonColor,
              borderColor: MyTheme.answersCardBorderColor,
              onPressed: () {
                // Navigate to the previous page
                if (context.read<GameCubit>().state.currentQuestionIndex > 0) {
                  context.read<GameCubit>().goToPreviousQuestion();
                  pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
            ),
            CustomButton(
              width: 150,
              text: "Skip",
              colorText: MyTheme.secondaryButtonTextColor,
              color: MyTheme.secondaryButtonColor,
              borderColor: MyTheme.answersCardBorderColor,
              onPressed: () {
                // Navigate to the next page
                if (context.read<GameCubit>().state.currentQuestionIndex < totalQuestions - 1) {
                  context.read<GameCubit>().goToNextQuestion();
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
            ),
          ],
        ));
  }
}
