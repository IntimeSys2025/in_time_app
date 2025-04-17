import 'package:flutter/material.dart';

sealed class AppColors {
  static const LinearGradient linearGradientGreen =
      const LinearGradient(colors: [
    Color(0xFF8AC54F),
    Color(0xFF89C44E),
    Color(0xFFAAD178),
  ],
        begin: Alignment.topCenter,
        // tileMode: TileMode.clamp
        // end: Alignment.bottomLeft,

      );

  static const Color kYellow = Color(0xffFFCC00);
  static const Color kDarkWhite = Color(0xffEEEEEE);
  static const Color kGray = Color(0xff7F8683);
  static const Color kLightGray  = Color(0xffD9D9D9);
  static const Color kVeryLightGray = Color(0xffEBEBEB);
  static const Color kRed = Color(0xffD63033);
  static const Color kOrange = Color(0xffF7A538);
  static const Color kBottomSheet = Color(0xffF5F8FF);


  static const Color kMintGreen = Color(0xff0E7178);
  static const Color kLightBlack = Color(0xff3C3C3C);
  static const Color kGrayBackground = Color(0xff818181);
  static const Color kBackgroundCard = Color(0xffF4F4F4);


  static const Color kGreenButton = Color(0xff66C87B);
  static const Color kLightGreen = Color(0xFF8AC54F);
  static const Color kVeryDarkGreen = Color(0xFF103913);
  static const Color kGreenBackground = Color(0xFF1B6459);

  static const Color scaffoldBackground = Colors.white;
  static const Color background = Color(0xFFf9f9f9);
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color darkBlue = Color(0xff1c4661);
  static const Color moreDarkBlue = Color(0xff112a3a);
  static const Color blue = Color(0xff0b7aea);
  static const Color grey = Color(0xff2a2a2a);
  static const Color moreLightGrey = Color(0xff9e9e9e);
  static const Color lightGrey = Color(0xff383839);
  static const Color darkGrey = Color(0xff1c1c1e);
  static const Color transparent = Colors.transparent;
  static const Color green = Colors.green;
  static const Color yellow = Colors.yellow;

  /// shimmer colors
  // baseColor: Colors.grey[300]!,
  // highlightColor: Colors.grey[100]!,
static Color baseColorShimmer = Colors.grey[300]!;
static Color highlightColorShimmer = Colors.grey[100]!;








  static const Color cardBgColor = Color(0xff363636);
  static const Color cardBgLightColor = Color(0xff999999);
  static const Color colorB58D67 = Color(0xffB58D67);
  static const Color colorE5D1B2 = Color(0xffE5D1B2);
  static const Color colorF9EED2 = Color(0xffF9EED2);
  static const Color colorEFEFED = Color(0xffEFEFED);
}
