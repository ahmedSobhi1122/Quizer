import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/core/constants/enum.dart';
import 'package:quizer/core/helper/data_intent.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/features/data_sources/local/app_prefs.dart';
import 'package:quizer/features/domain/entities/user.dart';
import 'package:quizer/features/presentation/common/background.dart';
import 'package:quizer/features/presentation/cubit/home_categories_cubit.dart';
import 'package:quizer/features/presentation/cubit/home_quizzes_cubit.dart';
import 'package:quizer/features/presentation/pages/Home%20Page/Widgets/custom_home_categories.dart';
import 'package:quizer/features/presentation/state/home_categories_state.dart';
import 'package:quizer/features/presentation/state/home_quizzes_state.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/dependency_injection.dart';
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
    String? userID = sl<AppPrefs>().getString(KeyPrefs.ID.name);
    String? token = sl<AppPrefs>().getString(KeyPrefs.TOKEN.name);
    DataIntent.pushToken(token!);
    DataIntent.pushUserID(userID!);    // TODO remove the push statements when Login/Register returns them

    context.read<HomeProfileCubit>().getHomeProfile(userID);
    context.read<HomeQuizzesCubit>().getHomeQuizzes(token);
    context.read<HomeCategoriesCubit>().getHomeCategories(token);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    late HomeProfileLoaded profileState;
    late HomeCategoriesLoaded categoriesState;
    late HomeQuizzesLoaded quizzesState;
    bool profileLoading = true;
    bool categoriesLoading = true;
    bool quizzesLoading = true;

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
                        profileState = state;
                        profileLoading = false;
                      }
                      else if (state is HomeProfileFailure) {
                        return Center(child: throw Exception(state.error));
                      }
                      return  Skeletonizer(
                      enabled: profileLoading,
                      child: profileLoading == false ?
                      CustomDailyTask(noRebuild: profileState.noRebuild,dailyTask: profileState.user.dailyTask!) :
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
                        categoriesState = state;
                        categoriesLoading = false;
                      }
                      else if (state is HomeCategoriesFailure) {
                        return Center(child: throw Exception(state.error));
                      }
                      return Skeletonizer(
                        enabled: categoriesLoading,
                        child: categoriesLoading == false ?
                        CustomHomeCategories(categories: categoriesState.categories) :
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
                        quizzesState = state;
                        quizzesLoading = false;
                      }
                      else if (state is HomeQuizzesFailure) {
                        return Center(child: throw Exception(state.error));
                      }
                      return  quizzesLoading == false ?
                        CustomHomeQuizzes(quizzes: quizzesState.quizzes) :
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
                  profileState = state;
                  profileLoading = false;
              }
              else if (state is HomeProfileFailure) {
                return Center(child: throw Exception(state.error));
              }
              return Skeletonizer(
                enabled: profileLoading,
                child: profileLoading == false ? CustomHomeAppbar(
                  imageUrl: Constants.url + profileState.user.profileImage!,
                  name: "${profileState.user.firstName!} ${profileState.user.lastName!}",
                  rank: profileState.rankToString(profileState.user.rank!),
                  points: profileState.user.points,
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
