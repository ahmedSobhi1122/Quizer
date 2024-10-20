import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/core/helper/image_handler.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/core/resources/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../../../../config/themes/theme.dart';
import '../../../../core/resources/app_colors.dart';
import '../common/background.dart';
import '../common/custom_button_with_shadow.dart';


class RatingScreen extends StatefulWidget {
  const RatingScreen({super.key});


  @override
  _RatingScreenState createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  double _rating = 0.0; // Variable to store the rating value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rating Screen'),
      ),
      body: Background(
        paddingLeft: AppPadding.defaultPadding.w,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            const ImageManager(url:LottieAssets.cup,width :AppSize.s100,height :AppSize.s100),
            const Text(
              'Congratliations , you finished the quiz ! ',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height:  AppSize.s10.h),
            const Text(
              'thank you for using quizer app during your assessment.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: AppSize.s4.h),
            const Text(
              'please rate the quiz .',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: AppSize.s4.h),
            const Text(
              'your result is : point.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height:  AppSize.s20.h),
            // Rating bar in a container with custom size
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: AppSize.s60.h,
              child: RatingBar.builder(
                initialRating: 0,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: AppColors.warningColor,
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    _rating = rating; // Update the rating value
                  });
                },
              ),
            ),
            Spacer(),
            SizedBox(height: AppSize.s30.h),
            // Custom button
            SizedBox(height:  AppSize.s10.h),
            CustomButton(
                text: "confirm",
                onPressed: ()
                {

                },
                color: MyTheme.secondaryButtonColor,
                colorText: MyTheme.secondaryButtonTextColor),
            SizedBox(
              child:
              TextButton(
                onPressed: () {
                  Share.share('my result is ');
                }, child: Text('share my result',style: TextStyle(fontSize: 18)),
              ),

            ),
          ],
        ),
      ),
    );
  }
}
