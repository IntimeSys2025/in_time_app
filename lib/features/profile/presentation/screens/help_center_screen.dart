import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_time_app/core/helpers/extension.dart';
import 'package:in_time_app/core/utils/app_colors.dart';
import 'package:in_time_app/features/home/presentation/widgets/custom_search_bar.dart';
import 'package:in_time_app/features/profile/presentation/logic/profile_cubit.dart';
import 'package:in_time_app/features/profile/presentation/widget/question_item.dart';
import '../../data/models/help_center_model.dart';

class HelpCenterScreen extends StatelessWidget {
  final List<HelpCenterModel> helpCenterData;
  const HelpCenterScreen({super.key, required this.helpCenterData});

  @override
  Widget build(BuildContext context) {
    final profileCubit = BlocProvider.of<ProfileCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help Center'),
        backgroundColor: AppColors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            10.heightSpace,
            CustomSearchBar(
              controller: TextEditingController(),
              onPressed: (value) {
                // homeCubit.filterServices();
              },
              hintText: 'Search',
              suffixIcon: const Icon(Icons.line_weight_sharp),
            ),
            10.heightSpace,
            Expanded(
              child: ListView.builder(
                itemCount: helpCenterData.length,
                itemBuilder: (context, index) {
                  return QuestionItem(helpCenterItem: helpCenterData[index]);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
