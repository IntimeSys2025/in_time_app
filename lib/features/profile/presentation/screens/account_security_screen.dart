import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_time_app/core/utils/app_colors.dart';
import '../logic/profile_cubit.dart';

class AccountSecurityScreen extends StatelessWidget {
  const AccountSecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final profileCubit = BlocProvider.of<ProfileCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Security'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            top: 30,left: 10,right: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: AppColors.kLightGray,
              ),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Remember Password'),
                trailing: BlocBuilder<ProfileCubit, ProfileState>(
                  // buildWhen: (previous, current) => current is UpdateSecurityKey,
                  builder: (context, state) {
                    return Switch(
                      value: context.read<ProfileCubit>().rememberPass ,
                      // activeColor: AppColors.green,

                      onChanged: (value) {
                        context
                            .read<ProfileCubit>()
                            .toggleSwitch('rememberPassword', value);
                      },
                    );
                  },
                ),
              ),
              const Divider(),
              ListTile(
                title: const Text('Face ID'),
                trailing: BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, state) {
                    return Switch(
                      value: context.read<ProfileCubit>().faceId,
                      onChanged: (value) {
                        context
                            .read<ProfileCubit>()
                            .toggleSwitch('faceId', value);
                      },
                    );
                  },
                ),
              ),
              const Divider(),
              ListTile(
                title: Text('Biometric ID'),
                trailing: BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, state) {
                    return Switch(
                      value:
                      context.read<ProfileCubit>().biometric ?? false,
                      onChanged: (value) {
                        context
                            .read<ProfileCubit>()
                            .toggleSwitch('biometricId', value);
                      },
                    );
                  },
                ),
              ),
              // const Divider(),
              // ListTile(
              //   title: Text('Google Authenticator'),
              //   trailing: Icon(Icons.chevron_right,size: 35,),
              //   onTap: () {
              //     // Navigate to Google Authenticator settings
              //   },
              // ),
            ],
          )
        ),
      ),
    );
  }
}
