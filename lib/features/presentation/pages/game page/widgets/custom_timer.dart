import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'package:quizer/core/resources/app_values.dart';

class CustomTimer extends StatefulWidget {
  final double durationInMinutes; // The total duration for the timer
  final Color borderColor;
  final Color backgroundColor;
  final List<Color> foregroundGradientColors;

  const CustomTimer({
    super.key,
    required this.durationInMinutes, // Required duration in minutes
    this.borderColor = AppColors.whiteColor,
    this.backgroundColor = AppColors.lightGreyColor,
    this.foregroundGradientColors = const [
      AppColors.lightPurpleColor,
      AppColors.primaryColor,
    ],
  });

  @override
  State<CustomTimer> createState() => _CustomTimerState();
}

class _CustomTimerState extends State<CustomTimer> {
  double _width = 0;
  late Timer _timer;
  double _elapsedTime = 0; // Tracks the elapsed time in seconds
  final double _maxWidth = AppSize.s240.w; // The full width of the progress bar

  @override
  void initState() {
    super.initState();
    final totalDurationInSeconds = widget.durationInMinutes * 60; // Convert minutes to seconds

    // Start a periodic timer that updates the progress bar every second
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        // Increase the elapsed time by 1 second
        _elapsedTime += 1;

        // Update the progress width based on the elapsed time
        _width = _maxWidth * (_elapsedTime / totalDurationInSeconds);

        // Stop the timer if the full duration has been reached
        if (_elapsedTime >= totalDurationInSeconds) {
          /// TODO Push To Rating + Send Request
          _timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: _maxWidth,
          height: AppSize.s16.h,
          decoration: BoxDecoration(
            border: Border.all(style: BorderStyle.solid, color: widget.borderColor),
            borderRadius: BorderRadius.circular(AppBorderRadius.br13.r),
            color: widget.backgroundColor,
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          width: _width,
          height: AppSize.s16.h,
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppBorderRadius.br13.r),
            gradient: LinearGradient(
              colors: widget.foregroundGradientColors,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ],
    );
  }
}
