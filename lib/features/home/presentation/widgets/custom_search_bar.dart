import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_time_app/core/utils/app_colors.dart';
import 'package:in_time_app/features/home/presentation/logic/home_cubit.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final Icon? suffixIcon;
  final String hintText;
  final Function(String value) onPressed;
  const CustomSearchBar(
      {super.key,
      required this.controller,
       this.suffixIcon,
      required this.hintText,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeCubit>(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.moreLightGrey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controller,
        onChanged: onPressed,
        decoration:  InputDecoration(
          suffixIcon: suffixIcon,
          icon: const Icon(Icons.search),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
