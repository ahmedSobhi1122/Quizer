
import 'package:flutter/material.dart';
import 'package:themed/themed.dart';

class MyTheme{

  static const backgroundColor = ColorRef(Colors.white,id: 'backgroundColor');
  static const backgroundColor1 = ColorRef(Color(0xFF8269F8));
  static const backgroundColor2 = ColorRef(Color(0xFFCCC3F9));
  static const backgroundColor3 = ColorRef(Color(0xFFECEBF2));

  /// Home
  static const appbarTop = ColorRef(Color(0xff8a72f9));
  static const appbarBottom = ColorRef(Color(0xff9b86fa));
  static const appbarShadow = ColorRef(Color(0xffa391fb));
  static  ColorRef contentCardBG = ColorRef(const Color(0xffFFFFFF).withOpacity(0.60));
  static const categoriesBG = ColorRef(Color(0xffa391fb));
  static const quizzesBG = ColorRef(Color(0xffa391fb));

  static const textColor = ColorRef(Colors.black,id: 'textColor');

  static const reverseColor = ColorRef(Colors.black,id: 'reverseColor');

  static const primaryButtonColor = ColorRef(Color(0xFF6C63FD),id: 'primaryButton');
  static const secondaryButtonColor = ColorRef(Color(0xFFD4D0F5),id: 'secondaryButton');

  static const primaryButtonTextColor = ColorRef(Colors.white,id: 'buttonTextColor');
  static const secondaryButtonTextColor = ColorRef(Color(0xFF6960FB),id: 'onButton');

  static const selectedBorder = ColorRef(Color(0xFF958EFF), id: 'selectedBorder');

  static const studentSelectColor = ColorRef(Color(0xFF7B61FD), id:'teacher');
  static const teacherSelectColor = ColorRef(Color(0xFFFDB461), id:'student');

  static const disabledColor = ColorRef(Color(0xFF757575),id: 'disabled');

  static const mainText = TextStyleRef(
    TextStyle(
      fontWeight: FontWeight.bold,
      color: textColor,
    ),
  );
}

Map<ThemeRef,Object> LightTheme = {
  MyTheme.backgroundColor : Colors.white,
  MyTheme.reverseColor : Colors.white,
  MyTheme.textColor: Colors.black.withOpacity(.8),
};


Map<ThemeRef,Object> DarkTheme = {
  MyTheme.backgroundColor :  const Color(0xFF141028),
  MyTheme.backgroundColor1 : const Color(0xff5f4dbe),
  MyTheme.backgroundColor2 : const Color(0xFF141028),
  MyTheme.backgroundColor3 : const Color(0xFF141028),

  /// Home
  MyTheme.appbarTop : const Color(0xFF4b3b99),
  MyTheme.appbarBottom: const Color(0xFF3F3280),
  MyTheme.appbarShadow: const Color(0xFF3F3280),
  MyTheme.contentCardBG:  const Color(0xFF525151).withOpacity(0.35),

  MyTheme.textColor: Colors.white,
  MyTheme.reverseColor : Colors.black,

  MyTheme.secondaryButtonColor : const Color(0xFF181636),

};