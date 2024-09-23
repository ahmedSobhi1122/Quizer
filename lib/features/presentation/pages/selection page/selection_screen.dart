import 'package:flutter/material.dart';
import 'package:quizer/core/helper/extensions.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/core/resources/text_styles.dart';
import 'package:quizer/features/presentation/common/custom_button_with_shadow.dart';
import 'package:quizer/features/presentation/common/custom_progress.dart';

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(children: [
        Row(
          children: [
            const BackButton(),
            SizedBox(
              width: context.width * .12,
            ),
            const CustomProgress(
              progress: 3,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.defaultPadding),
          child: Text('''What type of account would you like to create? 👦''',style: AppTextStyles.headerTextStyle(context),),
        ),
        SizedBox(height: context.height * .0966),
        const SelectedContainer(
          content: "Student",
          color: AppColors.purpleColor,
          icon: Icon(
            Icons.person,
            color: AppColors.whiteColor,
            size: 36,
          ),
        ),
        SizedBox(height: context.height * .032),
        const SelectedContainer(
          content: "Teacher",
          color: AppColors.warningColor,
          icon: Icon(
            Icons.person,
            color: AppColors.whiteColor,
            size: 36,
          ),
        ),
        const Spacer(),
        const CustomButton(text: "Next"),
      ]),
    ));
  }
}

class SelectedContainer extends StatefulWidget {
  const SelectedContainer(
      {super.key,
      required this.color,
      required this.icon,
      required this.content});

  final Color color;
  final Icon icon;
  final String content;

  @override
  State<SelectedContainer> createState() => _SelectedContainerState();
}

class _SelectedContainerState extends State<SelectedContainer> {
  Color _fillColor = AppColors.whiteColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _fillColor = _fillColor == AppColors.whiteColor
              ? widget.color
              : AppColors.whiteColor;
        });
      },
      child: Container(
        width: context.width * .814,
        height: context.height * .1,
        decoration: BoxDecoration(
          border: Border.all(
              style: BorderStyle.solid,
              color: AppColors.blackColor.withOpacity(.4)),
          borderRadius: BorderRadius.circular(AppBorderRadius.br24),
          color: _fillColor,
        ),
        child: Row(
          children: [
            Container(
              width: context.width * .28,
              height: context.height,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(AppBorderRadius.br24),
                  topLeft: Radius.circular(AppBorderRadius.br24),
                ),
                color: widget.color,
              ),
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p8),
                child: CircleAvatar(
                    backgroundColor: AppColors.blackColor.withOpacity(.25),
                    child: widget.icon),
              ),
            ),
            SizedBox(
              width: context.width * .046,
            ),
            Text(widget.content,style: AppTextStyles.selectedBoxTextStyle(context),)
          ],
        ),
      ),
    );
  }
}
