import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_time_app/core/shared_widgets/app_button_widget.dart';
import 'package:in_time_app/core/utils/app_colors.dart';
import 'package:in_time_app/features/profile/presentation/logic/profile_cubit.dart';

class UpdateProfilePicScreen extends StatelessWidget {
  final File image;
  const UpdateProfilePicScreen({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    final profileCubit = BlocProvider.of<ProfileCubit>(context);
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is UploadProfilePicLoadingState) {
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
        } else if (state is UploadProfilePicSuccessState) {
          Navigator.of(context, rootNavigator: true).pop();
          Navigator.pop(context);
        } else if (state is UploadProfilePicFailureState) {
          Navigator.of(context, rootNavigator: true).pop();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.errorMessage),
            backgroundColor: AppColors.kRed,
          ));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Profile picture'),
            backgroundColor: AppColors.white,
            centerTitle: true,
          ),
          body: Center(
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.file(image, fit: BoxFit.fitHeight),
                    GestureDetector(
                      onTap: () {
                        profileCubit.pickImage();
                      },
                      child: Container(
                        margin: const EdgeInsets.all(20),
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: AppColors.kGreenButton,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.edit,
                          color: AppColors.white,
                        ),
                      ),
                    ),

                    // IconButton(onPressed: () {}, icon: const Icon(Icons.edit))
                  ],
                )),
          ),
          bottomNavigationBar: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: AppButtonWidget(
                  title: 'Update',
                  onPressed: () {
                    profileCubit.updateProfilePic();
                  }),
            ),
          ),
        );
      },
    );
  }
}
