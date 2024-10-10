import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'package:quizer/core/resources/app_values.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> items;
  final String? selectedValue;
  final ValueChanged<String?>? onChanged;
  final String hint;

  const CustomDropdown({
    Key? key,
    required this.items,
    this.selectedValue,
    this.onChanged,
    required this.hint,
  }) : super(key: key);

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: Colors.white60,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Center(
        child: DropdownButton<String>(
          isExpanded: true,
          underline: const SizedBox.shrink(),
          dropdownColor: Colors.white60,
          icon: const Icon(Icons.arrow_drop_down),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ) ,
          value: _selectedValue,
          hint: Padding(
            padding: const EdgeInsets.only(left: AppPadding.p5),
            child: Text(
                widget.hint,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.whiteColor40,
                fontSize: AppSize.s16,
              ),
            ),
          ),
          items: widget.items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(
                  item,
                style: const TextStyle(
                  color: AppColors.darkPurpleColor30,
                ),
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _selectedValue = newValue;
            });
            if (widget.onChanged != null) {
              widget.onChanged!(newValue);
            }
          },
        ),
      ),
    );
  }
}
