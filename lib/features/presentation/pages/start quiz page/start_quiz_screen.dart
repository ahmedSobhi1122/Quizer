import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/config/routes/route_constants.dart';
import 'package:quizer/config/themes/theme.dart';
import 'package:quizer/core/constants/constants.dart';
import 'package:quizer/core/helper/data_intent.dart';
import 'package:quizer/core/helper/extensions.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/core/resources/text_styles.dart';
import 'package:quizer/features/domain/entities/quiz.dart';
import 'package:quizer/features/presentation/common/custom_button_with_shadow.dart';
import 'package:quizer/features/presentation/cubit/start_quiz_cubit.dart';
import 'package:quizer/features/presentation/pages/start%20quiz%20page/widgets/category.dart';
import 'package:quizer/features/presentation/pages/start%20quiz%20page/widgets/description.dart';
import 'package:quizer/features/presentation/pages/start%20quiz%20page/widgets/image_quiz.dart';
import 'package:quizer/features/presentation/pages/start%20quiz%20page/widgets/rate.dart';
import 'package:quizer/features/presentation/state/start_quiz_state.dart';
import 'package:skeletonizer/skeletonizer.dart';


class StartQuizScreen extends StatefulWidget {
  const StartQuizScreen({super.key});

  @override
  State<StartQuizScreen> createState() => _StartQuizScreenState();
}

class _StartQuizScreenState extends State<StartQuizScreen> {
  bool? _loading;
  Quiz? quiz;

  @override
  void initState() {
    String? userToken = DataIntent.getToken();
    int? quizID = DataIntent.getQuizID();
    context.read<StartQuizCubit>().getQuizData(userToken!, quizID!);
    _loading = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StartQuizCubit, StartQuizState>(
        builder: (context, state) {
      if (state is StartQuizLoaded) {
        _loading = false;
        quiz = state.quiz;
        print("_loading is false");
      }
      if (state is StartQuizFailure) {
        print(state.error);
      }
      return Skeletonizer(
        enabled: _loading!,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: MyTheme.backgroundColor,
            leading: const BackButton(
              color: MyTheme.textColor,
            ),
            //TODO pop the screen here
            title: Text(
              quiz == null ? "Math test" : quiz!.name!,
              style: AppTextStyles.statQuizTitleTextStyle(context),
            ),
          ),
          body: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: AppPadding.defaultPadding.w),
            child: Column(
              children: [
                SizedBox(height: AppSize.s10.h),
                quiz != null
                    ? ImageQuiz(
                        imageUrl: Constants.url + quiz!.image!,
                        authorImageUrl: Constants.url + quiz!.authorImage!,
                        authorName: quiz!.authorName,
                        playCount: quiz!.solveCount,
                      )
                    : const ImageQuiz(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: AppPadding.p32.h),
                  child: DisplayRate(
                    rating: quiz == null ? 1.5 : quiz!.rating!,
                  ),
                ),
                Description(
                  description:
                      quiz == null ? "Default Description" : quiz!.description!,
                ),
                SizedBox(height: AppSize.s32.h),
                Category(
                    maxTime: quiz == null ? 10 : quiz!.maxTime!,
                    questionsCount: quiz == null ? 10 : quiz!.questionCount!),
                const Spacer(),
                CustomButton(
                    color: AppColors.purpleColor,
                    colorText: AppColors.whiteColor,
                    text: "Start",
                    onPressed: () {
                      DataIntent.pushQuiz(quiz!);
                      context.pushReplacementNamed(Routes.gameScreenRoute);
                    }),
                SizedBox(height: AppSize.s50.h),
              ],
            ),
          ),
        ),
      );
    });
  }
}
