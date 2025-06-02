import 'package:flutter/material.dart';
import 'package:in_time_app/core/utils/app_colors.dart';
import 'package:in_time_app/core/utils/product_type.dart';
import 'package:in_time_app/features/home/presentation/screens/home_screen_more_than_category.dart';
import 'package:in_time_app/features/home/presentation/screens/home_screen_more_than_doctor.dart';

import '../../../../core/utils/app_constants.dart';
import 'home_screen_one_doctor.dart';

class NavigationBarScreen extends StatefulWidget {
  const NavigationBarScreen({super.key});

  @override
  State<NavigationBarScreen> createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: NavigationBar(
          backgroundColor: AppColors.white,
          shadowColor: AppColors.black,
          indicatorColor: AppColors.transparent,
          // height: 80,
          // indicatorShape: ,
          selectedIndex: selectedIndex,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          onDestinationSelected: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          destinations: <Widget>[
            NavigationDestination(
              icon: Icon(
                Icons.home,
                color: selectedIndex == 0
                    ? AppColors.kGreenBackground
                    : AppColors.grey,
                size: selectedIndex == 0
                    ? AppConstants.bigIcon
                    : AppConstants.smallIcon,
              ),
              label: 'home',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.list_alt,
                color: selectedIndex == 1
                    ? AppColors.kGreenBackground
                    : AppColors.grey,
                size: selectedIndex == 1
                    ? AppConstants.bigIcon
                    : AppConstants.smallIcon,
              ),
              label: 'list',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.calendar_month_outlined,
                color: selectedIndex == 2
                    ? AppColors.kGreenBackground
                    : AppColors.grey,
                size: selectedIndex == 2
                    ? AppConstants.bigIcon
                    : AppConstants.smallIcon,
              ),
              label: 'calender',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.menu,
                color: selectedIndex == 3
                    ? AppColors.kGreenBackground
                    : AppColors.grey,
                size: selectedIndex == 3
                    ? AppConstants.bigIcon
                    : AppConstants.smallIcon,
              ),
              label: 'more',
            ),
          ],
        ),
        body: <Widget>[
          (AppConstants.productType == ProductType.oneDoctor)
              ? const HomeScreenOneDoctor()
              : (AppConstants.productType == ProductType.moreThanOneDoctor)
                  ? const HomeScreenMoreThanDoctor()
                  : const HomeScreenMoreThanCategory(),
          Container(),
          Container(),
          Container(),
        ][selectedIndex]);
  }
}
