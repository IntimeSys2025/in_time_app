import 'package:flutter/material.dart';
import 'package:in_time_app/core/helpers/extension.dart';
import 'package:in_time_app/features/profile/presentation/widget/profile_action.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('About'),
        8.heightSpace,
        ProfileAction(
            title: 'Help Center',
            icon: const Icon(Icons.help_outline),
            onPressed: () {}),
        ProfileAction(
            title: 'Contact Us',
            icon: const Icon(Icons.error_outline),
            onPressed: () {}),
        ProfileAction(
            title: 'Privacy & Policy',
            icon: const Icon(Icons.lock_outline),
            onPressed: () {}),
        ProfileAction(
            title: 'Term & Condition',
            icon: const Icon(Icons.gavel_outlined),
            onPressed: () {}),
      ],
    );
  }
}
