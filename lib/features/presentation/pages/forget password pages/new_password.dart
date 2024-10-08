import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/core/helper/extensions.dart';
import 'package:quizer/core/resources/app_colors.dart'; // Adjust the import according to your project structure
import 'package:quizer/core/resources/text_styles.dart'; // Adjust the import according to your project structure
import 'package:quizer/features/presentation/common/custom_button_with_shadow.dart'; // Import your custom button
import 'package:quizer/features/presentation/common/custom_progress.dart';

import '../../../../core/resources/app_values.dart';
import '../../common/button_back.dart'; // Import your custom progress
// Import your custom back button

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  _NewPasswordScreenState createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;



  void _resetPassword() {
    if (_passwordController.text == _confirmPasswordController.text) {
      // Show success SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
            'Password saved successfully!',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 2),
        ),
      );
    } else {
      // Show error SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
            'Error: Passwords do not match!',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
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
        child: Padding(
          padding: EdgeInsets.all(AppPadding.p20.r), // Responsive padding
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: AppSize.s28.h,
              ),
              Row(
                children: [
                   CustomButtonBack( onPressed:()=>context.pop()),
                  SizedBox(
                    width: AppSize.s28.w,
                  ),
                  const CustomProgress(
                    start:2,
                    end: 1,
                  ),
                ],
              ),
               SizedBox(height: AppSize.s10.h), // Space after the row

              // Title
              Text(
                'Create new password 🔒',
                style: AppTextStyles.headerSignupTextStyle(context),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8), // Space between title and subtitle

              // Subtitle
              Text(
                'Create a new and strong password',
                style: AppTextStyles.subHeaderSignupTextStyle(context), // Adjust the style as needed
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: AppSize.s140.h,
              ),
              // Password Field
              TextField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                      color: AppColors.purpleColor50, // Adjust color as needed
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Confirm Password Field
              TextField(
                controller: _confirmPasswordController,
                obscureText: !_isConfirmPasswordVisible,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                      color: AppColors.purpleColor50, // Adjust color as needed
                    ),
                    onPressed: () {
                      setState(() {
                        _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                height: AppSize.s300.h,
              ),
              // Reset Password Button
              CustomButton(
                text: 'Reset Password',
                onPressed: _resetPassword,
                color: AppColors.purpleColor50, // Use your color resource
                colorText: AppColors.whiteColor, // Text color
              ),
            ],
          ),
        ),
      ),
    );
  }
}