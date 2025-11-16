import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_time_app/core/shared_widgets/app_button_widget.dart';
import 'package:in_time_app/features/profile/presentation/logic/profile_cubit.dart';

class UpdateProfilePicScreen extends StatelessWidget {
  final File image;
  const UpdateProfilePicScreen({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    final profileCubit = BlocProvider.of<ProfileCubit>(context);
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if(state is UpdateProfileLoadingState){

        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Profile picture'),
            centerTitle: true,
          ),
          body: Center(
            child: Padding(padding: const EdgeInsets.all(10),
            child: Image.file(image, fit: BoxFit.fitHeight)),
          ),
          bottomNavigationBar: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: AppButtonWidget(
                  title: 'Update', onPressed: () {
                    profileCubit.updateProfilePic();

              }),
            ),
          ),
        );
      },
    );
  }
}
