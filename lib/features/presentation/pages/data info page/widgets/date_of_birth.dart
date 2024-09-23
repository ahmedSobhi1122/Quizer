import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'package:quizer/core/resources/text_styles.dart';

class DateOfBirth extends StatefulWidget {
  const DateOfBirth({super.key});

  @override
  State<DateOfBirth> createState() => _DateOfBirthState();
}

class _DateOfBirthState extends State<DateOfBirth> {
  TextEditingController dateInput = TextEditingController();

  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: dateInput,
      decoration: const InputDecoration(
        suffixIcon: Icon(Icons.calendar_today),
        labelText: "Date Of Birth",
        hoverColor: AppColors.purpleColor,
        hintStyle: TextStyle(color: AppColors.purpleColor50),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
      ),
      style: AppTextStyles.textStyle(context),
      readOnly: true,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1950),
            //DateTime.now() - not to allow to choose before today.
            lastDate: DateTime(2100));

        if (pickedDate != null) {
          String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
          setState(() {
            dateInput.text =
                formattedDate; //set output date to TextField value.
          });
        } else {}
      },
    );
  }
}
