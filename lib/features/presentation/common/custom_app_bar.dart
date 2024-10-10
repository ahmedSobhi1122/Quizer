import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/features/presentation/common/button_back.dart';
import 'package:quizer/features/presentation/common/custom_progress.dart';

class CustomAppBar extends StatelessWidget {
  final void Function()? onPressed;
  final double? start;
  final double? end;

  const CustomAppBar({
    this.onPressed,
    this.start,
    this.end,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomButtonBack(
          onPressed: onPressed ??
              () => SchedulerBinding.instance.addPostFrameCallback((_) {
                    Navigator.pop(context);
                  }),
        ),
        SizedBox(
          width: AppSize.s28.w,
        ),
        CustomProgress(
          start: start,
          end: end,
        ),
      ],
    );
  }
}
