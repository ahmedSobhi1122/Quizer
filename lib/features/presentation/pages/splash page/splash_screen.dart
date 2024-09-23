import 'package:quizer/core/helper/extensions.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'package:quizer/core/resources/app_fonts.dart';
import 'package:quizer/core/resources/assets_manager.dart';

import 'package:quizer/config/routes/screen_export.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      // Navigator.of(context).pushReplacement(
      //   MaterialPageRoute(builder: (context) => const SelectionScreen()),
      // );
      context.pushReplacementNamed(Routes.selectionScreenRoute);
    });

    return Scaffold(
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
                    Image.asset(
                      ImageAssets.logo,
                      width: context.width * 0.326,
                      height: context.width * 0.326,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Quizzer',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: FontSize.f22,
                          fontFamily: FontConstants.primaryEnglishFont,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircularProgressIndicator(
                      valueColor:
                      AlwaysStoppedAnimation<Color>(AppColors.purpleColor),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}