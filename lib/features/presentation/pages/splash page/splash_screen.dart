import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quizer/core/helper/extensions.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'package:quizer/core/resources/app_fonts.dart';
import 'package:quizer/core/resources/assets_manager.dart';
import 'package:lottie/lottie.dart';
import 'package:quizer/config/routes/screen_export.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    Future.delayed(const Duration(seconds: 3 ),
        () => context.pushReplacementNamed(Routes.selectionScreenRoute));

    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.purpleColor50,
                AppColors.purpleColor30,
                AppColors.purpleColor10,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                const Expanded(
                  flex: 1,
                  child: SizedBox.shrink(),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        SVGAssets.logo,
                        width: 140.w,
                        height: 140.h,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Quizzer',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 32.sp,
                            fontFamily: FontConstants.primaryEnglishFont,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Lottie.asset(
                        LottieAssets.loading,
                        width: 100.w,
                        height: 100.h,
                      ),
                      SizedBox(height: 20),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
