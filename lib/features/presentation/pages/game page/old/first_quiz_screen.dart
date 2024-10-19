import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quizer/features/presentation/pages/quiz%20page/old/second_quiz_screen.dart';

class CustomProgressComponent extends StatefulWidget {
  @override
  _CustomProgressComponentState createState() =>
      _CustomProgressComponentState();
}

class _CustomProgressComponentState extends State<CustomProgressComponent>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Timer _timer;
  int _timeElapsed = 0;
  final int _totalTime = 15; // 15 seconds

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller for the progress bar
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: _totalTime),
    )..addListener(() {
      setState(() {});
    });

    // Start the timer to update progress every second
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        _timeElapsed++;
        _animationController.value = _timeElapsed / _totalTime;

        // Check if the timer has reached the total time
        if (_timeElapsed == _totalTime) {
          _timer.cancel();
          _navigateToNextScreen();
        }
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _timer.cancel();
    super.dispose();
  }

  void _navigateToNextScreen() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => NextScreen(), // Replace with your next screen
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Custom Progress Component')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              value: _animationController.value,
              strokeWidth: 6.0,
            ),
            SizedBox(height: 20),
            Text(
              '${_totalTime - _timeElapsed}s remaining',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}