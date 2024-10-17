import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/features/domain/entities/user.dart';
import 'package:quizer/features/presentation/common/background.dart';
import 'package:quizer/features/presentation/cubit/home_cubit.dart';
import 'package:quizer/features/presentation/pages/Home%20Page/Widgets/custom_home_categories.dart';
import 'package:quizer/features/presentation/state/home_state.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/resources/assets_manager.dart';
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
  late HomeProfileDataSuccess? profileST;
  late HomeQuizzesDataSuccess? quizST;
  late HomeCategoriesDataSuccess? categoryST;
  bool profileSuccess = false;
  bool quizzesSuccess = false;
  bool categoriesSuccess = false;
  bool _loading = true;


  @override
  void initState() {
    // String? userID = DataIntent.getUserID();
    // String? token = DataIntent.getToken();
    String token = "eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJnaXZlbl9uYW1lIjoiemVpYWQiLCJmYW1pbHlfbmFtZSI6Im1vaGFtbWVkIiwiZW1haWwiOiJ6YXphb3NrYXI5MjhAZ21haWwuY29tIiwibmJmIjoxNzI5MDM4Nzg2LCJleHAiOjE3MzAyNDgzODYsImlhdCI6MTcyOTAzODc4NiwiaXNzIjoiaHR0cDovL2xvY2FsaG9zdDo1MjI2IiwiYXVkIjoiaHR0cDovL2xvY2FsaG9zdDo1MjI2In0.58w65fyn17yi-5t0Qzdza5zYZoKvouRNibQf9mOH867umzUEIWKrDQZkdCgznZoteKJiAHLTSzlq4l8EAPpcoA";
    String userID = "fed87f19-df40-4f97-9302-aabaf6438203";

    context.read<HomeCubit>().getHomeProfileData(userID);
    context.read<HomeCubit>().getHomeQuizzesData(token);
    context.read<HomeCubit>().getHomeCategoriesData(token);
    super.initState();
  }

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
                /// Daily Task
                SliverToBoxAdapter(
                  child: BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      if(categoriesSuccess && quizzesSuccess && profileSuccess)
                      {
                          _loading = false;
                      }
                      if (state is HomeProfileDataSuccess) {
                        profileST = state;
                        profileSuccess = true;
                        print("profile-dailyTask is true");
                      }
                      else if (state is HomeFailure) {
                        return Center(child: Text(state.error));
                      }
                      return  Skeletonizer(
                      enabled: _loading,
                      child: _loading == false ?
                      CustomDailyTask(noRebuild: profileST!.noRebuild,dailyTask: profileST!.user.dailyTask!) :
                      CustomDailyTask(noRebuild: true,dailyTask: DailyTask()),
                      );
                    },
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(height: AppSize.s43.h),
                ),
                SliverToBoxAdapter(
                  child: CustomClickableTitles(
                    title: "Categories",
                    clickable: "View All",
                    clickableOnTap: () async {}, // TODO add function here
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(height: AppSize.s12.h),
                ),
                /// Categories
                SliverToBoxAdapter(
                  child: BlocBuilder<HomeCubit, HomeState>(
                    builder: (context,state) {
                      if(categoriesSuccess && quizzesSuccess && profileSuccess)
                      {
                          _loading = false;
                      }
                      if (state is HomeCategoriesDataSuccess) {
                        categoryST = state;
                        categoriesSuccess = true;
                        print("category is true");
                      }
                      else if (state is HomeFailure) {
                        return  Center(child: Text(state.error));
                      }
                      return Skeletonizer(
                        enabled: _loading,
                        child: _loading == false ?
                        const CustomHomeCategories() :
                        const CustomHomeCategories()
                      );
                    }
                  )
                ),
                SliverToBoxAdapter(
                  child: SizedBox(height: AppSize.s43.h),
                ),
                SliverToBoxAdapter(
                  child: CustomClickableTitles(
                    title: "Quizzes",
                    clickable: "View All",
                    clickableOnTap: () =>
                        print("I view all quizzes"), // TODO add function here
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(height: AppSize.s12.h),
                ),
                /// Quizzes SliverGrid.Builder
                SliverToBoxAdapter(
                  child: BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      if(categoriesSuccess && quizzesSuccess && profileSuccess)
                      {
                          _loading = false;
                      }
                      if (state is HomeQuizzesDataSuccess) {
                        quizST = state;
                        quizzesSuccess = true;
                        print("quiz is true");
                      }
                      else if (state is HomeFailure) {
                        return Center(child: Text(state.error));
                      }
                      return  Skeletonizer(
                        enabled: _loading,
                        child:  _loading == false ?
                        CustomHomeQuizzes(quizzes: quizST!.quizzes) :
                        const CustomHomeQuizzes(),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if(categoriesSuccess && quizzesSuccess && profileSuccess)
              {
                _loading = false;
              }
              if (state is HomeProfileDataSuccess) {
                  profileST = state;
                  profileSuccess = true;
                  print("profile-appBar is true");
              }
              else if (state is HomeFailure) {
                return const SizedBox.shrink();
              }
              return Skeletonizer(
                enabled: _loading,
                child: _loading == false ? CustomHomeAppbar(
                  imageUrl: Constants.url + profileST!.user.profileImage!,
                  name: "${profileST!.user.firstName!} ${profileST!.user.lastName!}",
                  rank: profileST!.rankToString(profileST!.user.rank!),
                  points: profileST!.user.points,
                ) : const CustomHomeAppbar(
                  imageUrl: ImageAssets.avatar,
                  name: "Default Name",
                  points: 9999,
                  rank: "Newbie",
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
