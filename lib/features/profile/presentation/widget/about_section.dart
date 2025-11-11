import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_time_app/core/helpers/extension.dart';
import 'package:in_time_app/features/profile/presentation/logic/profile_cubit.dart';
import 'package:in_time_app/features/profile/presentation/screens/contact_us_screen.dart';
import 'package:in_time_app/features/profile/presentation/screens/content_page_screen.dart';
import 'package:in_time_app/features/profile/presentation/screens/help_center_screen.dart';
import 'package:in_time_app/features/profile/presentation/widget/profile_action.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final profileCubit = BlocProvider.of<ProfileCubit>(context);
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is GetContentPagesSuccess) {
          Navigator.of(context, rootNavigator: true).pop(); // close dialog if open
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ContentPageScreen(
                  title: state.title,
                  htmlContent: state.content.content,
                ),
              ));
        } else if (state is GetHelpCenterSuccess) {
          Navigator.of(context, rootNavigator: true).pop(); // close dialog if open
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HelpCenterScreen(
                  helpCenterData: state.data,
                ),
              ));
        } else if (state is GetContentPagesLoading) {
          showDialog(
            context: context,
            builder: (context) {
              return const Center(
                  child: SizedBox(
                    height: 50,
                      width: 50,
                      child: CircularProgressIndicator()));
            },
          );
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('About'),
          8.heightSpace,
          ProfileAction(
              title: 'Help Center',
              icon: const Icon(Icons.help_outline),
              onPressed: () {
                profileCubit.getHelpCenter();
              }),
          ProfileAction(
              title: 'Contact Us',
              icon: const Icon(Icons.error_outline),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ContactUsScreen(),
                    ));
              }),
          ProfileAction(
              title: 'Privacy & Policy',
              icon: const Icon(Icons.lock_outline),
              onPressed: () {
                profileCubit.getPrivacyPolicy();
              }),
          ProfileAction(
              title: 'Term & Condition',
              icon: const Icon(Icons.gavel_outlined),
              onPressed: () {
                profileCubit.getTermsConditions();
              }),
        ],
      ),
    );
  }
}
