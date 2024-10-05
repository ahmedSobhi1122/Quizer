import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quizer/core/resources/app_fonts.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/core/resources/assets_manager.dart';
import 'package:quizer/config/routes/screen_export.dart';
import 'package:lottie/lottie.dart';
import 'package:quizer/features/presentation/common/background.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // Future.delayed(const Duration(seconds: 3),
    //     () => context.pushReplacementNamed(Routes.onbordingScreenRoute));

    return Scaffold(
      body: Background(
        paddingRight: AppSize.s0,
        paddingLeft: AppSize.s0,
        paddingTop: AppSize.s0,
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: AppSize.s218.h,),
              SvgPicture.asset(
                SVGAssets.logo,
                width: AppSize.s140.w,
                height: AppSize.s140.w,
              ),
              SizedBox(height: AppSize.s20.h),
              Text(
                'Quizzer',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: FontSize.f22,
                  fontFamily: FontConstants.primaryEnglishFont,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 218.h,),
              Lottie.asset(
                LottieAssets.loading,
                width: AppSize.s100.w,
                height: AppSize.s100.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}