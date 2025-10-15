import 'package:flutter/material.dart';
import 'package:in_time_app/core/utils/app_colors.dart';
import 'package:in_time_app/features/profile/data/models/help_center_model.dart';

class QuestionItem extends StatelessWidget {
  final HelpCenterModel helpCenterItem;
  const QuestionItem({super.key, required this.helpCenterItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ExpansionTile(
        // shape: Border.all(color: Colors.transparent),
        shape: const Border(bottom: BorderSide(color: AppColors.kGray)),
        collapsedShape:
            const Border(bottom: BorderSide(color: AppColors.kGray)),

        title: Text(
          helpCenterItem.question ?? '',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        trailing: const RotationTransition(
          turns: AlwaysStoppedAnimation(0.5),
          child: Icon(Icons.keyboard_arrow_up, size: 24),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              helpCenterItem.answer ?? '',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
        ],
      ),
    );
  }
}
