import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/core/helper/validation.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/core/resources/text_styles.dart';
import 'package:quizer/features/presentation/cubit/register_cubit.dart';


class DateOfBirth extends StatefulWidget {
  const DateOfBirth({super.key});

  @override
  State<DateOfBirth> createState() => _DateOfBirthState();
}

class _DateOfBirthState extends State<DateOfBirth> {
  DateTime? pickedDate;

  @override
  void initState() {
    // context.read<RegisterCubit>().birthDateController.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => Validation.validateBirthDate(pickedDate),
      controller: context.read<RegisterCubit>().birthDateController,
      decoration: style(
        "Date Of Birth",
        icon: const Icon(
          Icons.calendar_today,
          color: AppColors.purpleColor,
        ),
      ),
      style: AppTextStyles.textStyle(context),
      focusNode: context.read<RegisterCubit>().dobFocusNode,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (_) => FocusScope.of(context)
          .requestFocus(context.read<RegisterCubit>().phoneNumberFocusNode),
      readOnly: true,
      onTap: () async {
        print("---------------------------3");
        pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1950),
            //DateTime.now()
            lastDate: DateTime(2100));

        print("---------------------------1");
        print(pickedDate);
        if (pickedDate != null) {
          String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate!).toString();
          setState(() {
            context.read<RegisterCubit>().birthDateController.text =
                formattedDate;
          });
          print(pickedDate);
        }
        print("---------------------------2");
      },
    );
  }
}

InputDecoration style(String text, {Icon? icon}) {
  return InputDecoration(
    suffixIcon: icon,
    labelText: text,
    labelStyle: const TextStyle(color: AppColors.purpleColor),
    contentPadding: EdgeInsets.all(AppPadding.defaultPadding.r),
  );
}
