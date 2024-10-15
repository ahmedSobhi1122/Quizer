import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/features/presentation/common/background.dart';
import 'package:quizer/features/presentation/pages/Home%20Page/Widgets/custom_home_categories.dart';

import '../../../../core/dependency_injection.dart';
import '../../../domain/usecases/get_home_profile_data_usecase.dart';
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
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(height: AppSize.s160.h),
                ),
                const SliverToBoxAdapter(
                  child: CustomDailyTask(),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(height: AppSize.s43.h),
                ),
                SliverToBoxAdapter(
                  child: CustomClickableTitles(
                    title: "Categories",
                    clickable: "View All",
                    clickableOnTap: () async
                    {
                      final GetHomeProfileUseCase getHomeProfileUseCase = GetHomeProfileUseCase(sl());
                      await getHomeProfileUseCase.call("92aecb4b-1dcf-4606-8982-653e1799c474");
                    }, // TODO add function here
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(height: AppSize.s12.h),
                ),
                const SliverToBoxAdapter(
                  child: CustomHomeCategories(),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(height: AppSize.s43.h),
                ),
                SliverToBoxAdapter(
                  child: CustomClickableTitles(
                    title: "More Games",
                    clickable: "View All",
                    clickableOnTap: () =>
                        print("I view all quizzes"), // TODO add function here
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(height: AppSize.s12.h),
                ),
                const CustomHomeMoreGames(),
              ],
            ),
          ),
          const CustomHomeAppbar()
        ],
      ),
    );
  }
}
