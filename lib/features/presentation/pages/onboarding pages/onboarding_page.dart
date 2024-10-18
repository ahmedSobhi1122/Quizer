import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quizer/config/routes/screen_export.dart';
import 'package:quizer/core/helper/extensions.dart';
import 'package:quizer/core/resources/assets_manager.dart';
import 'package:quizer/features/presentation/common/background.dart';
import 'package:quizer/features/presentation/common/custom_button_with_shadow.dart';

import '../../../../config/themes/theme.dart';
import '../../../../core/resources/app_values.dart';

class OnboardingContent {
  final String image;
  final String title;
  final String description;

  OnboardingContent({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<OnboardingContent> contents = [
  OnboardingContent(
    image: SVGAssets.onboarding1,
    title: '',
    description: 'Discover amazing features and enjoy the experience.',
  ),
  OnboardingContent(
    image: SVGAssets.onboarding2,
    title: '',
    description: 'Connect with people around the world easily.',
  ),
  OnboardingContent(
    image: SVGAssets.onboarding3,
    title: '',
    description: 'Join us today and enjoy all the benefits.',
  ),
];

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _controller,
                    itemCount: contents.length,
                    onPageChanged: (int index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    itemBuilder: (_, i) {
                      return Padding(
                        padding: const EdgeInsets.all(40),
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              contents[i].image,
                              height: 300,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              contents[i].title,
                              style: const TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: MyTheme.textColor,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              contents[i].description,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 18,
                                color: MyTheme.textColor,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    contents.length,
                    (index) => buildDot(index, context),
                  ),
                ),
                SizedBox(height: AppSize.s40.h),
                currentIndex == contents.length - 1
                    ? const BuildButton()
                    : const SizedBox.shrink(),
                SizedBox(height: AppSize.s40.h),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: MyTheme.textColor,
      ),
    );
  }
}

class BuildButton extends StatelessWidget {
  const BuildButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CustomButton(
          text: "Get Started!",
          onPressed: () {
            context.pushReplacementNamed(Routes.signUpScreenRoute);
          },
          color: MyTheme.primaryButtonColor,
          colorText: MyTheme.primaryButtonTextColor),
      SizedBox(height: AppSize.s10.h),
      CustomButton(
          text: "Already have an account?",
          onPressed: () {
            context.pushReplacementNamed(Routes.logInScreenRoute);
          },
          color: MyTheme.secondaryButtonColor,
          colorText: MyTheme.secondaryButtonTextColor),
    ]);
  }
}
