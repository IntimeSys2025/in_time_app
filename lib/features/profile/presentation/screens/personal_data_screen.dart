import 'package:easy_localization/easy_localization.dart' as locale;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_time_app/core/helpers/extension.dart';
import 'package:in_time_app/core/shared_widgets/app_button_widget.dart';
import 'package:in_time_app/core/shared_widgets/app_text_field.dart';
import 'package:in_time_app/core/utils/app_colors.dart';
import 'package:in_time_app/features/profile/presentation/logic/profile_cubit.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pinput/pinput.dart';

import '../../../../core/utils/app_constants.dart';
import '../../../account/presentation/screens/reset_password_screen.dart';

class PersonalDataScreen extends StatelessWidget {
  const PersonalDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileCubit = BlocProvider.of<ProfileCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Data'),
        backgroundColor: AppColors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                          'https://c8.alamy.com/comp/TC2FPE/young-man-avatar-cartoon-character-profile-picture-TC2FPE.jpg'), // Replace with your image asset
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      // margin: EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        color: AppColors.green,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.edit,
                        color: AppColors.white,
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ),
              20.heightSpace,
              Row(
                children: [
                  Expanded(
                    child: AppTextField(
                      obscureText: false,
                      labelText: 'First name',
                      hintText: AppConstants.fullName.split(' ').first,
                      controller: profileCubit.firstNameController,
                      onChanged: (value) {
                        profileCubit.firstNameController.setText(value);
                      },
                    ),
                  ),
                  10.widthSpace,
                  Expanded(
                    child: AppTextField(
                      obscureText: false,
                      labelText: 'Last name',
                      hintText: AppConstants.fullName.split(' ').last,
                      controller: profileCubit.lastNameController,
                      onChanged: (value) {
                        profileCubit.lastNameController.text = value;
                      },
                    ),
                  )
                ],
              ),
              20.heightSpace,
              Directionality(
                  textDirection: TextDirection.ltr,
                  child: IntlPhoneField(
                    invalidNumberMessage: 'Invalid phone Number',
                    decoration: const InputDecoration(
                      // hintText: AppConstants.userMobile ?? 'Phone Number',
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                    initialCountryCode: 'EG',
                    validator: (value) {
                      debugPrint('Val:: ${value?.completeNumber}');
                      return null;
                      // return createAccountCubit.validatePhoneNumber(value!);
                    },
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.phone,
                    // countries: ["SA"],
                    onChanged: (phone) {
                      profileCubit.mobile = phone;
                    },
                  )),
              10.heightSpace,
              const Text('Additional Mobile Number'),
              10.heightSpace,
              Directionality(
                  textDirection: TextDirection.ltr,
                  child: IntlPhoneField(
                    invalidNumberMessage: 'Invalid phone Number',
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                    initialCountryCode: 'EG',
                    validator: (value) {
                      debugPrint('Val:: ${value?.completeNumber}');
                      return null;
                      // return createAccountCubit.validatePhoneNumber(value!);
                    },
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.phone,
                    // countries: ["SA"],
                    onChanged: (phone) {
                      // cubit.loginPhone = phone;
                      profileCubit.additionalMobile = phone;
                    },
                  )),

              /// Date of birth
              TextFormField(
                controller: profileCubit.dateOfBirthController,
                // inputFormatters: ,
                onTap: () async {
                  // if (isDatePicker) {
                  final DateTime? date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    lastDate: DateTime.now(),
                  );
                  // String formattedDate = DateFormat('yyyy-MM-dd','en').format(date)
                  if (date != null) {
                    profileCubit.dateOfBirthController.text =
                        locale.DateFormat('yyyy-MM-dd', 'en').format(date!);
                  }
                  // cubit.setDateOfBirth(date ?? DateTime.now());

                  // }
                },
                // validator: isPassword ? validatePassword :(value) {
                //   if (isPassword) {
                //     debugPrint('ValPass:: ${validatePassword(value)}');
                //     return validatePassword(value);
                //   }else{
                //     if (value == null || value.isEmpty) {
                //       return hintText;
                //     }
                //     return null;
                //   }
                //
                // },
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Date of birth',
                  hintText: 'Enter your Date Of Birth',
                  suffixIcon: const Icon(Icons.calendar_today),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              20.heightSpace,
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ResetPasswordScreen(),
                        ));
                  },
                  child: const Text(
                    'Change password',
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                ),
              )
              // AppButtonWidget(
              //     title: 'Change password',
              //     onPressed: () {
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //             builder: (context) => const ResetPasswordScreen(),
              //           ));
              //     })
            ],
          ),
        ),
      ),
      bottomNavigationBar: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is UpdateProfileSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
                 const SnackBar(content: Text('Data updated successfully.'),backgroundColor: AppColors.kGreenButton,));
          }
        },
        builder: (context, state) {
          return (state is UpdateProfileLoadingState)
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: AppButtonWidget(
                        title: 'Save Changes',
                        backgroundColor: AppColors.green,
                        onPressed: () {
                          profileCubit.updateProfile();
                        }),
                  ),
                );
        },
      ),
    );
  }
}
