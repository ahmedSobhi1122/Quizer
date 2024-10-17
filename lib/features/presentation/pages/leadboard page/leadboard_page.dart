
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quizer/core/resources/app_fonts.dart';
import 'package:quizer/core/resources/text_styles.dart';

import '../../../../config/routes/screen_export.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_values.dart';
import '../../common/background.dart';
class LeaderBoardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Leaderboard"),
        backgroundColor:AppColors.appbar_top, // Replace with your custom color or AppColors.appbar_top if defined
      ),
      body: Background(
        child: Stack(
          children:[
             Row(
              mainAxisAlignment:MainAxisAlignment.spaceEvenly,
              children: <Widget>[
              const SizedBox(height: double.infinity),
               SizedBox(width:AppSize.s10.w),
                Container(
                  height:AppSize.s700.h,
                  width: AppSize.s116.w,
                  child:  Column(
                   crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SvgPicture.asset(
                        'assets/svg/bronze_medal.svg',
                        height: AppSize.s40.h,
                        width: AppSize.s40.h,
                      ),
                      CircleAvatar(
                        radius: 28,
                        child: Placeholder(
                        color: Colors.grey.shade300,
                      ),
                      ),
                      Expanded(
                        child: Container(

                          color:AppColors.bronze,

                          child: Column(

                            children: <Widget>[
                              Text(
                                'Abdo Mohamed',
                                style:AppTextStyles.leaderBoardRanktitleTextStyle(context),
                              ),
                              Text(
                                '1550 points',
                                style:AppTextStyles.leaderBoardRankSubtitleTextStyle(context),
                              ),
                              // Add more children as needed
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  height:AppSize.s825.h,
                  width: AppSize.s150.w,
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SvgPicture.asset(
                        'assets/svg/golden_medal.svg',
                        height: AppSize.s40.h,
                        width: AppSize.s40.h,
                      ),
                      CircleAvatar(
                        radius: 28,
                        child: Placeholder(
                          color: Colors.grey.shade300,
                        ),
                      ),
                      Expanded(
                        child: Container(

                          color:AppColors.gold,

                          child: Column(

                            children: <Widget>[
                              Text(
                                'Abdo Mohamed',
                                style:AppTextStyles.leaderBoardRanktitleTextStyle(context),
                              ),
                              Text(
                                '1750 points',
                                style:AppTextStyles.leaderBoardRankSubtitleTextStyle(context),
                              ),
                              // Add more children as needed
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  height:AppSize.s775.h,
                  width: AppSize.s150.w,
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SvgPicture.asset(
                        'assets/svg/silver_medal.svg',
                        height: AppSize.s40.h,
                        width: AppSize.s40.h,
                      ),
                      CircleAvatar(
                        radius: 28,
                        child: Placeholder(
                          color: Colors.grey.shade300,
                        ),
                      ),
                      Expanded(
                        child: Container(

                          color:AppColors.silver,

                          child: Column(

                            children: <Widget>[
                              Text(
                                'Abdo Mohamed',
                                style:AppTextStyles.leaderBoardRanktitleTextStyle(context),
                              ),
                              Text(
                                '1600 points',
                                style:AppTextStyles.leaderBoardRankSubtitleTextStyle(context),
                              ),
                              // Add more children as needed
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )



            ],),

            MyDraggableSheet(
            child:Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primary,   // Primary color from the theme
                    Theme.of(context).colorScheme.secondary, // Secondary color from the theme
                    Theme.of(context).colorScheme.tertiary ?? Colors.grey,  // Tertiary fallback to grey if undefined
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),

            ),
          ),]
        ),
      ),
    );
  }
}

class MyDraggableSheet extends StatelessWidget {
  final Widget child;

  const MyDraggableSheet({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.8, // Adjusted for better visibility
      minChildSize: 0.25,
      maxChildSize: 1.0,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.purpleColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(AppBorderRadius.br16)),
          ),
          child: ListView.builder(
            controller: scrollController,

            itemCount: 10,
            padding:  EdgeInsets.all(AppPadding.p10.r),
            itemBuilder: (context,index){
              return UserProfileCard(name: 'khaled', points: 150, rank: 3);

            },
            // Link the ListView to the ScrollController

          ),
        );
      },
    );
  }
}
class UserProfileCard extends StatelessWidget {
  final String name;
  final int points;
  final int rank;

  UserProfileCard({required this.name, required this.points, required this.rank});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: AppPadding.p8.h),
      child: Container(
        padding: EdgeInsets.all(AppPadding.p16.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppBorderRadius.br8),
          boxShadow: [
            BoxShadow(
              color: AppColors.gray.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 32.0,
                  child: Placeholder(
                    color: Colors.grey.shade300,
                  ),
                ),
                Positioned(
                  top: 42.0,
                  left: 42.0,
                  child: Container(
                    width: AppSize.s20.w,
                    height: AppSize.s20.h,
                    decoration: BoxDecoration(
                      color: AppColors.gray,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '$rank',
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: AppSize.s16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style:AppTextStyles.leaderBoardCardTitleTextStyle(context)
                  ),
                  SizedBox(height:AppSize.s8.h),
                  Text(
                    '$points points',
                    style:AppTextStyles.leaderBoardCardSubtitleTextStyle(context)
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
