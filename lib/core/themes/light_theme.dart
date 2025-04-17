import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_colors.dart';
import '../utils/app_constants.dart';
import '../utils/app_font_size.dart';

sealed class LightTheme {
  static ThemeData theme() {
    return ThemeData(
      colorScheme: const ColorScheme.light(
        primary: AppColors.kGreenButton,
        secondary: AppColors.darkBlue,
        surface: AppColors.background,
        onPrimary: AppColors.black,
        onSecondary: AppColors.black,
        onSurface: AppColors.black,
      ),
      iconTheme:  const IconThemeData(
        color: AppColors.kLightGreen,
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontFamily: 'Poppins',
          fontSize: AppFontSize.fontSize20.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.black,
        ),
        bodyMedium: TextStyle(
          fontFamily: 'Poppins',
          fontSize: AppFontSize.fontSize18.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.black,
        ),
        bodySmall: TextStyle(
          fontFamily: 'Poppins',
          fontSize: AppFontSize.fontSize16.sp,
          color: AppColors.black,
        ),
        bodyLarge: TextStyle(
          fontFamily: 'Poppins',
          fontSize: AppFontSize.fontSize14.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.black,
        ),
        displayMedium: TextStyle(
          fontFamily: 'Poppins',
          fontSize: AppFontSize.fontSize12.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.black,
        ),
        displaySmall: TextStyle(
          fontFamily: 'Poppins',
          fontSize: AppFontSize.fontSize10.sp,
          color: AppColors.black,
        ),
      ),
      indicatorColor: AppColors.kGreenButton,
      inputDecorationTheme: InputDecorationTheme(
        activeIndicatorBorder: BorderSide(
          color: AppColors.kGreenButton,
          width: 2.w,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.radius12.r),
          borderSide: const BorderSide(
            color: AppColors.grey,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.radius12.r),
          borderSide: const BorderSide(
            color: AppColors.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.radius12.r),
          borderSide: BorderSide(
            color: AppColors.darkBlue,
            width: 2.w,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppConstants.padding12.sp,
          vertical: AppConstants.padding16.sp,
        ),
        isDense: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(AppColors.kGreenButton),
          surfaceTintColor: WidgetStateProperty.all(AppColors.blue),
          shadowColor: WidgetStateProperty.all(AppColors.grey),
          // overlayColor: WidgetStateProperty.all(AppColors.blue),
          foregroundColor: WidgetStateProperty.all(AppColors.white),
          overlayColor: WidgetStateProperty.resolveWith(
                (states) {
              return states.contains(WidgetState.pressed)
                  ? AppColors.moreDarkBlue
                  : null;
            },
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppConstants.radius12.r ),
            ),
          ),
        ),
      ),
      dividerTheme: const DividerThemeData(
        space: 0,
        thickness: 1,
        color: AppColors.grey,
      ),
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: AppColors.kLightGreen,
        selectedIconTheme: const IconThemeData(
          color: AppColors.white,
        ),
        indicatorColor: AppColors.moreDarkBlue,
        indicatorShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppConstants.radius12.r),
          ),
        ),
        unselectedIconTheme: const IconThemeData(
          color: AppColors.grey,
        ),
        selectedLabelTextStyle: TextStyle(
          color: AppColors.white,
          fontSize: AppFontSize.fontSize14.sp,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelTextStyle: TextStyle(
          color: AppColors.grey,
          fontSize: AppFontSize.fontSize14.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      listTileTheme: const ListTileThemeData(
        selectedColor: AppColors.kGreenButton,
        iconColor: AppColors.white,
        textColor: AppColors.white,
        dense: true,
        selectedTileColor: AppColors.darkBlue,
      ),
    );
  }
}
