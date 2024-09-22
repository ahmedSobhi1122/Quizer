import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  pop() => Navigator.of(this).pop();

  pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  pushNamedAndRemoveUntil(String routeName,
      {Object? arguments, required RoutePredicate predicate}) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }
}

extension MediaQueryValues on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  double get topPadding => MediaQuery.of(this).viewPadding.top;
  double get bottom => MediaQuery.of(this).viewInsets.bottom;
}

extension StringExtension on String? {
  RegExp get isContainsLink {
    return RegExp(
      r'((http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?([a-z0-9]+([-\.]{1}[a-z0-9]+)*\.[a-z]{2,5})(:[0-9]{1,5})?(\/\S*)?)',
      caseSensitive: false,
      multiLine: true,
    );
  }

  bool isNullOrEmpty() => this == null || this!.isEmpty || this == '';
}