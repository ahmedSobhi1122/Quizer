import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/features/presentation/common/background.dart';
import 'package:quizer/features/presentation/pages/Home%20Page/Widgets/custom_home_categories.dart';

import 'Widgets/custom_clickable_titles.dart';
import 'Widgets/custom_daily_task.dart';
import 'Widgets/custom_home_appbar.dart';
import 'Widgets/custom_home_moregames.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(
            paddingRight: AppPadding.p24,
            paddingLeft: AppPadding.p24,
            paddingTop: AppPadding.p50,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: AppSize.s160.h),
                  const CustomDailyTask(),
                  SizedBox(height: AppSize.s43.h),
                  CustomClickableTitles(
                    title: "Categories",
                    clickable: "View All",
                    clickableOnTap: () => print(
                        "I view all categories"), // TODO add function here
                  ),
                  SizedBox(height: AppSize.s12.h),
                  const CustomHomeCategories(),
                  SizedBox(height: AppSize.s43.h),
                  CustomClickableTitles(
                    title: "More Games",
                    clickable: "View All",
                    clickableOnTap: () =>
                        print("I view all quizzes"), // TODO add function here
                  ),
                  SizedBox(height: AppSize.s12.h),
                   const CustomHomeMoreGames(),
                ],
              ),
            ),
          ),
          const CustomHomeAppbar()
        ],
      ),
    );
  }
}
