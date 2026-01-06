import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_time_app/core/helpers/extension.dart';
import 'package:in_time_app/core/utils/app_colors.dart';
import 'package:in_time_app/core/utils/app_font_size.dart';
import 'package:in_time_app/features/home/presentation/widgets/custom_search_bar.dart';
import 'package:in_time_app/features/profile/presentation/logic/profile_cubit.dart';
import 'package:in_time_app/features/profile/presentation/widget/question_item.dart';
import '../../data/models/help_center_model.dart';

class HelpCenterScreen extends StatelessWidget {
  final List<HelpCenterModel> helpCenterData;
  final List<HelpCenterModel> helpCenterDataInTime;
  const HelpCenterScreen(
      {super.key,
      required this.helpCenterData,
      required this.helpCenterDataInTime});

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
          crossAxisAlignment: CrossAxisAlignment.start,
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
            const Text(
              'Tenant Questions',
              style: TextStyle(
                  fontSize: AppFontSize.fontSize18,
                  fontWeight: FontWeight.w600),
            ),
            10.heightSpace,
            Expanded(
              child: ListView.builder(
                itemCount: helpCenterData.length,
                itemBuilder: (context, index) {
                  return QuestionItem(helpCenterItem: helpCenterData[index]);
                },
              ),
            ),
            10.heightSpace,
            const Divider(
              thickness: 5,
            ),
            10.heightSpace,
            const Text(
              'InTime Questions',
              style: TextStyle(
                  fontSize: AppFontSize.fontSize18,
                  fontWeight: FontWeight.w600),
            ),
            10.heightSpace,
            Expanded(
              child: ListView.builder(
                itemCount: helpCenterDataInTime.length,
                itemBuilder: (context, index) {
                  return QuestionItem(
                      helpCenterItem: helpCenterDataInTime[index]);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
