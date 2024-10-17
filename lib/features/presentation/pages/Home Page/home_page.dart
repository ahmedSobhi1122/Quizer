import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/core/helper/data_intent.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/features/domain/entities/user.dart';
import 'package:quizer/features/presentation/common/background.dart';
import 'package:quizer/features/presentation/cubit/home_categories_cubit.dart';
import 'package:quizer/features/presentation/cubit/home_quizzes_cubit.dart';
import 'package:quizer/features/presentation/pages/Home%20Page/Widgets/custom_home_categories.dart';
import 'package:quizer/features/presentation/state/home_categories_state.dart';
import 'package:quizer/features/presentation/state/home_quizzes_state.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../cubit/home_profile_cubit.dart';
import '../../state/home_profile_state.dart';
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
  void initState() {
    // String? userID = DataIntent.getUserID();
    // String? token = DataIntent.getToken();
    String token = "eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJnaXZlbl9uYW1lIjoiemVpYWQiLCJmYW1pbHlfbmFtZSI6Im1vaGFtbWVkIiwiZW1haWwiOiJ6YXphb3NrYXI5MjhAZ21haWwuY29tIiwibmJmIjoxNzI5MDM4Nzg2LCJleHAiOjE3MzAyNDgzODYsImlhdCI6MTcyOTAzODc4NiwiaXNzIjoiaHR0cDovL2xvY2FsaG9zdDo1MjI2IiwiYXVkIjoiaHR0cDovL2xvY2FsaG9zdDo1MjI2In0.58w65fyn17yi-5t0Qzdza5zYZoKvouRNibQf9mOH867umzUEIWKrDQZkdCgznZoteKJiAHLTSzlq4l8EAPpcoA";
    String userID = "fed87f19-df40-4f97-9302-aabaf6438203";
    DataIntent.pushToken(token);
    DataIntent.pushUserID(userID);    // TODO remove the push statements when Login/Register returns them

    context.read<HomeProfileCubit>().getHomeProfile(userID);
    context.read<HomeQuizzesCubit>().getHomeQuizzes(token);
    context.read<HomeCategoriesCubit>().getHomeCategories(token);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    late HomeProfileLoaded _profileState;
    late HomeCategoriesLoaded _categoriesState;
    late HomeQuizzesLoaded _quizzesState;
    bool _profileLoading = true;
    bool _categoriesLoading = true;
    bool _quizzesLoading = true;

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
                  child: BlocBuilder<HomeProfileCubit, HomeProfileState>(
                    builder: (context, state) {
                      if (state is HomeProfileLoaded) {
                        _profileState = state;
                        _profileLoading = false;
                      }
                      else if (state is HomeProfileFailure) {
                        return Center(child: throw Exception(state.error));
                      }
                      return  Skeletonizer(
                      enabled: _profileLoading,
                      child: _profileLoading == false ?
                      CustomDailyTask(noRebuild: _profileState.noRebuild,dailyTask: _profileState.user.dailyTask!) :
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
                  child: BlocBuilder<HomeCategoriesCubit, HomeCategoriesState>(
                    builder: (context,state) {
                      if (state is HomeCategoriesLoaded) {
                        _categoriesState = state;
                        _categoriesLoading = false;
                      }
                      else if (state is HomeCategoriesFailure) {
                        return Center(child: throw Exception(state.error));
                      }
                      return Skeletonizer(
                        enabled: _categoriesLoading,
                        child: _categoriesLoading == false ?
                        CustomHomeCategories(categories: _categoriesState.categories) :
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
                  child: BlocBuilder<HomeQuizzesCubit, HomeQuizzesState>(
                    builder: (context, state) {
                      if (state is HomeQuizzesLoaded) {
                        _quizzesState = state;
                        _quizzesLoading = false;
                      }
                      else if (state is HomeQuizzesFailure) {
                        return Center(child: throw Exception(state.error));
                      }
                      return  _quizzesLoading == false ?
                        CustomHomeQuizzes(quizzes: _quizzesState.quizzes) :
                        const CustomHomeQuizzes();
                    },
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<HomeProfileCubit, HomeProfileState>(
            builder: (context, state) {
              if (state is HomeProfileLoaded) {
                  _profileState = state;
                  _profileLoading = false;
              }
              else if (state is HomeProfileFailure) {
                return Center(child: throw Exception(state.error));
              }
              return Skeletonizer(
                enabled: _profileLoading,
                child: _profileLoading == false ? CustomHomeAppbar(
                  imageUrl: Constants.url + _profileState.user.profileImage!,
                  name: "${_profileState.user.firstName!} ${_profileState.user.lastName!}",
                  rank: _profileState.rankToString(_profileState.user.rank!),
                  points: _profileState.user.points,
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
