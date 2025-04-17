import 'package:flutter/material.dart';

extension MediaQueryValues on BuildContext {

  double get height => MediaQuery.sizeOf(this).height;

  double get width => MediaQuery.sizeOf(this).width;

  double get toPadding => MediaQuery.of(this).viewPadding.top;

  double get bottom => MediaQuery.of(this).viewInsets.bottom;

  TextStyle? style20 ({FontWeight? fontWeight,Color? color}) => Theme.of(this).textTheme.displayLarge?.copyWith(fontWeight: fontWeight,color: color);
  TextStyle? style18 ({FontWeight? fontWeight}) => Theme.of(this).textTheme.bodyMedium?.copyWith(fontWeight: fontWeight);
  TextStyle? style16 ({FontWeight? fontWeight}) => Theme.of(this).textTheme.bodySmall?.copyWith(fontWeight: fontWeight);
  TextStyle? style14 ({FontWeight? fontWeight}) => Theme.of(this).textTheme.bodyLarge?.copyWith(fontWeight: fontWeight);
  TextStyle? style12 ({FontWeight? fontWeight}) => Theme.of(this).textTheme.displayMedium?.copyWith(fontWeight: fontWeight);
  TextStyle? style10 ({FontWeight? fontWeight}) => Theme.of(this).textTheme.displaySmall?.copyWith(fontWeight: fontWeight);
}

extension EmptySpace on num {
  Widget get heightSpace => SizedBox(height: toDouble());
  Widget get widthSpace => SizedBox(width: toDouble());
}

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.pushNamed(this, routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.pushReplacementNamed(this, routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(
      String routeName,
      RoutePredicate predicate, {
        Object? arguments,
      }) {
    return Navigator.pushNamedAndRemoveUntil(
      this,
      routeName,
      predicate,
      arguments: arguments,
    );
  }

  void pop() => Navigator.pop(this);
}

extension ShowSnakbarExtension on BuildContext {
  void showSnackBar(
      String text, {
        Color? snackColor,
        Color? textColor,
        TextAlign? textAlign,
      }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        backgroundColor: snackColor,
        content: Text(
          text,
          style: TextStyle(color: textColor ?? Colors.white),
          textAlign: textAlign ?? TextAlign.center,
        ),
      ),
    );
  }
}
