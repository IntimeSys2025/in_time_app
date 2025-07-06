import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_time_app/core/utils/app_colors.dart';
import 'package:in_time_app/features/home/presentation/logic/home_cubit.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeCubit>(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.moreLightGrey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child:  TextField(
        controller: cubit.searchController,
        onChanged: (value) {
          cubit.filterServices();
        },
        decoration: InputDecoration(
          icon: Icon(Icons.search),
          hintText: 'Find a service',
          border: InputBorder.none,
        ),
      ),
    );
  }
}
