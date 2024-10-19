import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/config/themes/theme.dart';
import 'package:quizer/core/constants/constants.dart';
import 'package:quizer/core/helper/data_intent.dart';
import 'package:quizer/core/helper/extensions.dart';
import 'package:quizer/core/resources/assets_manager.dart';
import 'package:quizer/features/domain/entities/quiz.dart';
import 'package:quizer/features/presentation/pages/Login%20page/login_screen.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../config/routes/screen_export.dart';
import '../../../../../core/resources/app_values.dart';
import '../../../../../core/resources/text_styles.dart';

class CustomHomeQuizzes extends StatelessWidget {
  final List<Quiz>? quizzes;
  static SliverGridDelegateWithFixedCrossAxisCount gridDelegate =
      SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: AppSize.s24.w,
          mainAxisSpacing: AppSize.s24.h,
          childAspectRatio: 172 / 273);
  static const NeverScrollableScrollPhysics gridPhysics =
      NeverScrollableScrollPhysics();

  const CustomHomeQuizzes({super.key, this.quizzes = const []});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: gridDelegate,
      itemCount: quizzes!.isEmpty ? 2 : quizzes!.length,
      shrinkWrap: true,
      physics: gridPhysics,
      itemBuilder: (context, index) {
        return CustomQuiz(quiz: quizzes!.isEmpty ? null : quizzes![index]);
      },
    );
  }
} // TODO GridView.builder here -- better change to sliver I think

class CustomQuiz extends StatelessWidget {
  final Quiz? quiz;

  const CustomQuiz({super.key, this.quiz});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
        enabled: quiz == null ? true : false,
        child: InkWell(
          onTap: ()
          {
            DataIntent.pushQuizID(quiz!.id);
            context.pushNamed(Routes.startQuizScreenRoute);
          },
          child: Container(
                decoration: BoxDecoration(
          color: MyTheme.contentCardBG,
          borderRadius: BorderRadius.circular(AppBorderRadius.br16),
                ),
                child: Column(
          children: [
            Flexible(
              flex: 1,
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppBorderRadius.br16),
                    topRight: Radius.circular(AppBorderRadius.br16),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(quiz == null ? ImageAssets.cringe : Constants.url + quiz!.image!),
                          fit: BoxFit.cover),
                    ),
                  )),
            ), // TODO image here
            Flexible(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(
                    top: AppPadding.p8.h,
                    left: AppPadding.p8.w,
                    right: AppPadding.p8.w,
                    bottom: AppPadding.p12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: quiz == null ? "Default Name" : quiz!.name,
                            style: AppTextStyles.homeTitlesTextStyle(context),
                          ),
                          TextSpan(
                            text: quiz == null ? "\n • By Me" : "\n • By ${quiz!.authorName}",
                            style:
                                AppTextStyles.homeGameCardTitleTextStyle(context),
                          ),
                        ],
                      ),
                    ),
                    // Title and Author
                    const Spacer(),
                     CustomInfo(
                      questions: quiz == null ? 5 : quiz!.questionCount!,
                      time: quiz == null ? 5 : quiz!.maxTime!,
                      rate: quiz == null ? 0.0 : double.parse(quiz!.rating!.toStringAsFixed(1))
                       ,
                    )
                  ],
                ),
              ),
            ) // TODO CardData here
          ],
                ),
              ),
        ));
  }
}

class CustomInfo extends StatelessWidget {
  final int questions;
  final int time;
  final double rate;

  const CustomInfo(
      {super.key,
      required this.questions,
      required this.time,
      required this.rate});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("$questions Question",
            style: AppTextStyles.homeGameCardTitleTextStyle(context)),
        const CustomDot(),
        CustomInfoComponent(data: "${time}Min", icon: Icons.timer),
        const CustomDot(),
        CustomInfoComponent(data: "$rate/5", icon: Icons.star),
      ],
    );
  }
}

class CustomInfoComponent extends StatelessWidget {
  final String data;
  final IconData icon;

  const CustomInfoComponent(
      {super.key, required this.data, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(data, style: AppTextStyles.homeGameCardTitleTextStyle(context)),
      Icon(
        icon,
        size: AppSize.s10.r,
      )
    ]);
  }
}

class CustomDot extends StatelessWidget {
  const CustomDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(" • ",
        style: AppTextStyles.homeGameCardTitleTextStyle(context));
  }
}
