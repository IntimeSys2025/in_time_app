import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_time_app/core/helpers/extension.dart';
import 'package:in_time_app/features/account/presentation/screens/loginScreen.dart';
import 'package:in_time_app/features/profile/presentation/logic/profile_cubit.dart';
import 'package:in_time_app/features/profile/presentation/widget/about_section.dart';
import 'package:in_time_app/features/profile/presentation/widget/manage_account_section.dart';
import 'package:in_time_app/features/profile/presentation/widget/personal_info_section.dart';
import 'package:in_time_app/features/profile/presentation/widget/profile_info.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../home/presentation/widgets/welcome_header.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.moreLightGrey,
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: BlocListener<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is LogoutSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
              backgroundColor: AppColors.kGreenButton,
            ));
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                )).then((value) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.message),
                backgroundColor: AppColors.kGreenButton,
                duration: const Duration(seconds: 3),
              ));
                },);
          }else if(state is LogoutFailureState){

            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
              backgroundColor: AppColors.kRed,
            ));
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.heightSpace,
                (AppConstants.userToken != '')
                    ? const ProfileInfo()
                    : const WelcomeHeader(
                        showNotificationIcon: false,
                      ),
                10.heightSpace,
                const PersonalInfoSection(),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Divider(
                      thickness: 8,
                      color: AppColors.moreLightGrey.withValues(alpha: 0.1),
                    )),
                const AboutSection(),
                if (AppConstants.userToken != '')
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Divider(
                        thickness: 8,
                        color: AppColors.moreLightGrey.withValues(alpha: 0.1),
                      )),
                if (AppConstants.userToken != '') const ManageAccountSection()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
