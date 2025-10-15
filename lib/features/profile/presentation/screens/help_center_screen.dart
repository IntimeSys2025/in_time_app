import 'package:flutter/material.dart';
import 'package:in_time_app/features/profile/presentation/widget/question_item.dart';
import '../../data/models/help_center_model.dart';

class HelpCenterScreen extends StatelessWidget {
  final List<HelpCenterModel> helpCenterData;
  const HelpCenterScreen({super.key, required this.helpCenterData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help Center'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: helpCenterData.length,
        itemBuilder: (context, index) {
        return QuestionItem(helpCenterItem: helpCenterData[index]);
      },),
    );
  }
}
