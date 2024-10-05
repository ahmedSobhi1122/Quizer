import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quizer/core/helper/extensions.dart';
import 'package:quizer/core/resources/assets_manager.dart';
import 'package:quizer/core/resources/app_colors.dart';

import '../../../../config/routes/route_constants.dart';


// Custom Button widget
class CustomButton extends StatelessWidget {
  final Color color;
  final Color colorText;
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    required this.color,
    required this.colorText,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: colorText,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}

// OnboardingContent model class
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

// Declare the contents for the onboarding screens
final List<OnboardingContent> contents = [
  OnboardingContent(
    image: SVGAssets.onboarding1,
    title: 'Welcome to Our App',
    description: 'Discover amazing features and enjoy the experience.',
  ),
  OnboardingContent(
    image: SVGAssets.onboarding2,
    title: 'Stay Connected',
    description: 'Connect with people around the world easily.',
  ),
  OnboardingContent(
    image: SVGAssets.onboarding3,
    title: 'Get Started Now!',
    description: 'Join us today and enjoy all the benefits.',
  ),
];

class OnboardingScreen extends StatefulWidget {
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
          // Background gradient
          Container(
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
          ),
          // Onboarding content
          Column(
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
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            contents[i].description,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              // Dots indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  contents.length,
                      (index) => buildDot(index, context),
                ),
              ),
              const SizedBox(height: 20), // Add spacing between dots and buttons
              // If we're on the last screen, show two buttons
              currentIndex == contents.length - 1
                  ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  children: [
                    // "Get Started!" custom button
                    CustomButton(
                      color: AppColors.lightPurpleColor.withOpacity(.7),
                      colorText: Colors.white, // Text color is now white
                      text: "Get Started!",
                      onPressed: () {
                        context.pushNamed(Routes.forgetPasswordScreenRoute); // Navigate to home
                      },
                    ),
                    const SizedBox(height: 20), // Spacing between buttons
                    // "Already have an account?" custom button
                    CustomButton(
                      color: AppColors.purpleColor50, // Dark purple background
                      colorText: Colors.white, // White text
                      text: "Already have an account?",
                      onPressed: () {
                        context.pushNamed(Routes.dataInfoScreenRoute); // Navigate to login
                      },
                    ),
                  ],
                ),
              )
              // For other screens, no button will be shown
                  : const SizedBox(), // Show an empty container when it's not the last screen
            ],
          ),
        ],
      ),
    );
  }

  // Dots indicator for the onboarding screens
  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
