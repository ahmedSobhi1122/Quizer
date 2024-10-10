import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/features/presentation/common/background.dart';

import '../../../../core/resources/app_colors.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Background(
    paddingRight: AppSize.s24,
    paddingLeft: AppSize.s24,
    paddingTop: AppSize.s50,
    child: SingleChildScrollView(
      child: Column(
        children: [
          CustomHomeAppBar()
          ],
      ),
    )
      )
    );
  }
}

// Custom AppBar
class CustomHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomAppbarProfile(),


      ],
    );
  }

  // Override to provide custom AppBar height
  @override
  Size get preferredSize => Size.fromHeight(AppSize.s150.h);
}

// Custom AppBar Profile
class CustomAppbarProfile extends StatelessWidget {
  const CustomAppbarProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Circular Avatar with border
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white.withOpacity(0.80),
                width: AppSize.s2.r,
              ),
            ),
            child: Padding(
              padding:  EdgeInsets.all(AppPadding.p8.r),
              child:  FittedBox(
                fit: BoxFit.contain,
                child: CircleAvatar(
                  radius: AppSize.s30.r,
                  backgroundColor: Colors.amberAccent,
                  backgroundImage: AssetImage('assets/images/avatar.png'),
                ),
              ),
            ),
          ), // TODO change colors
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: AppPadding.p12.h),
                child: Text("Ahmed Mohsen",style: TextStyle(color: Colors.white),),
              ),
              CustomAppBarRank(),
            ],
          ),),
        ],
      );
  }
}

// Custom AppBar Rank
class CustomAppBarRank extends StatelessWidget {
  const CustomAppBarRank({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.orangeAccent.withOpacity(0.6),
        border: Border.all(color: AppColors.orange.withOpacity(0.6)),
        borderRadius: BorderRadius.circular(100)
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: AppPadding.p2.r,horizontal: AppPadding.p8.r),
        child: Text("Expert", style: TextStyle(color: Colors.white,fontSize: 10)),
      ),
    );
  }
}



