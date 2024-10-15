import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quizer/config/themes/theme.dart';
import 'package:quizer/core/resources/app_fonts.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/core/resources/assets_manager.dart';

class Logo extends StatefulWidget {
  const Logo({
    super.key,
  });

  @override
  State<Logo> createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  double _opacity = 0.1;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 1),
      () => setState(() {
        _opacity = 1.0;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(seconds: 2),
      opacity: _opacity,
      curve: Curves.easeOut,
      child: Column(children: [
        SvgPicture.asset(
          SVGAssets.logo,
          width: AppSize.s140.w,
          height: AppSize.s140.w,
        ),
        SizedBox(height: AppSize.s20.h),
        Text(
          'Quizzer',
          style: TextStyle(
            color: MyTheme.textColor,
            fontSize: FontSize.f22,
            fontFamily: FontConstants.primaryEnglishFont,
            fontWeight: FontWeight.bold,
          ),
        ),
      ]),
    );
  }
}
