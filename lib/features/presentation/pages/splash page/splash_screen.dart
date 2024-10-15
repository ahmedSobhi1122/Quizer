import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:quizer/config/themes/theme.dart';
import 'package:quizer/core/helper/extensions.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/config/routes/screen_export.dart';
import 'package:quizer/core/resources/assets_manager.dart';
import 'package:quizer/features/presentation/common/background.dart';
import 'package:quizer/features/presentation/common/loading.dart';
import 'package:quizer/features/presentation/pages/splash%20page/widgets/logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3),
        () => context.pushReplacementNamed(Routes.onbordingScreenRoute));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        paddingRight: AppSize.s0,
        paddingLeft: AppSize.s0,
        paddingTop: AppSize.s0,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: AppSize.s218.h,
              ),
              const Logo(),
              SizedBox(
                height: 218.h,
              ),
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
