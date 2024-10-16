import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/core/helper/data_intent.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/features/domain/entities/user.dart';
import 'package:quizer/features/presentation/common/background.dart';
import 'package:quizer/features/presentation/pages/Home%20Page/Widgets/custom_home_categories.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../cubit/home_cubit.dart';
import '../../state/home_state.dart';
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
    String? userID = DataIntent.getUserID();
    String? token = DataIntent.getToken();

    context
        .read<HomeCubit>()
        .getHomeProfileData("fed87f19-df40-4f97-9302-aabaf6438203",
        "eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJnaXZlbl9uYW1lIjoiemVpYWQiLCJmYW1pbHlfbmFtZSI6Im1vaGFtbWVkIiwiZW1haWwiOiJ6YXphb3NrYXI5MjhAZ21haWwuY29tIiwibmJmIjoxNzI5MDM4Nzg2LCJleHAiOjE3MzAyNDgzODYsImlhdCI6MTcyOTAzODc4NiwiaXNzIjoiaHR0cDovL2xvY2FsaG9zdDo1MjI2IiwiYXVkIjoiaHR0cDovL2xvY2FsaG9zdDo1MjI2In0.58w65fyn17yi-5t0Qzdza5zYZoKvouRNibQf9mOH867umzUEIWKrDQZkdCgznZoteKJiAHLTSzlq4l8EAPpcoA"
        );
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
                      if (state is HomeProfileDataLoading) {
                        return  Skeletonizer(
                          enabled: true,
                          child: CustomDailyTask(noRebuild: true,dailyTask: DailyTask()),
                        );
                      }
                      else if (state is HomeProfileDataSuccess) {
                        return  CustomDailyTask(noRebuild: state.noRebuild,dailyTask: state.user.dailyTask!,);
                      }
                      else if (state is HomeFailure) {
                        return const SizedBox.shrink();
                      }
                      return const SizedBox.shrink();
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
                const SliverToBoxAdapter(
                  child: CustomHomeCategories(),
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
                      if (state is HomeProfileDataLoading) {
                        return const Skeletonizer(
                          enabled: true,
                          child:  CustomHomeQuizzes(),
                        );
                      }
                      else if (state is HomeProfileDataSuccess) {
                        return  CustomHomeQuizzes(quizzes: state.quizzes,);
                      }
                      else if (state is HomeFailure) {
                        return const SizedBox.shrink();
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeProfileDataLoading) {
                return const Skeletonizer(
                  enabled: true,
                  child: CustomHomeAppbar(
                    imageUrl: ImageAssets.avatar,
                    name: "Default Name",
                    points: 9999,
                    rank: "Newbie",

                  ),
                );
              }
              else if (state is HomeProfileDataSuccess) {
                return CustomHomeAppbar(
                  imageUrl: Constants.url + state.user.profileImage!,
                  name: "${state.user.firstName!} ${state.user.lastName!}",
                  rank: state.rankToString(state.user.rank!),
                  points: state.user.points,
                );
              }
              else if (state is HomeFailure) {
                return const SizedBox.shrink();
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
