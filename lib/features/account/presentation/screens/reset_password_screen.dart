import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_time_app/core/helpers/extension.dart';
import 'package:in_time_app/core/shared_widgets/app_text_field.dart';
import 'package:in_time_app/core/utils/app_asset_path.dart';
import 'package:in_time_app/core/utils/app_colors.dart';
import 'package:in_time_app/features/home/presentation/screens/home_screen_one_doctor.dart';
import 'package:in_time_app/features/profile/presentation/logic/profile_cubit.dart';
import '../../../../core/shared_widgets/password_text_field_widget.dart';
import '../../../home/presentation/screens/navigation_screen.dart';
import '../logic/create_account_cubit.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({
    super.key,
  });

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {

  bool _obscureOldPassword = true;
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;

  // final TextEditingController _oldPasswordController = TextEditingController();
  // final TextEditingController _newPasswordController = TextEditingController();
  // final TextEditingController _confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ProfileCubit>(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Reset password'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: SafeArea(
          child: BlocConsumer<ProfileCubit, ProfileState>(
            listener: (context, state) {
              if (state is ResetPasswordFailureState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.errorMessage),
                    backgroundColor: Colors.red,
                  ),
                );
              } else if (state is ResetPasswordSuccessState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.successMessage),
                    backgroundColor: Colors.green,
                  ),
                );
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => const NavigationBarScreen(),
                //     ));
                Navigator.pop(context);
              }
            },
            buildWhen: (previous, current) =>
                current is ResetPasswordLoadingState ||
                current is ResetPasswordSuccessState ||
                current is ResetPasswordFailureState,
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Enter New Password',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Please enter your new password',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 32),
                  Center(
                    child: Image.asset(
                      AppAsset.inTimeApp, // Replace with your asset
                      height: 200,
                    ),
                  ),
                  const SizedBox(height: 32),
                  // New Password Field
                  // Directionality(
                  //     textDirection: TextDirection.ltr,
                  //     child: IntlPhoneField(
                  //       invalidNumberMessage: 'Invalid phone Number',
                  //       decoration: const InputDecoration(
                  //         labelText: 'Phone Number',
                  //         border: OutlineInputBorder(
                  //           borderSide: BorderSide(),
                  //         ),
                  //       ),
                  //       initialCountryCode: 'EG',
                  //       validator: (value) {
                  //         debugPrint('Val:: ${value?.completeNumber}');
                  //         return null;
                  //         // return createAccountCubit.validatePhoneNumber(value!);
                  //       },
                  //       inputFormatters: [
                  //         FilteringTextInputFormatter.digitsOnly
                  //       ],
                  //       keyboardType: TextInputType.phone,
                  //       // countries: ["SA"],
                  //       onChanged: (phone) {
                  //         // cubit.loginPhone = phone;
                  //       },
                  //     )),
                  // const SizedBox(height: 16),
                  Form(
                      key: cubit.resetPasswordFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            controller: cubit.oldPasswordController,
                            obscureText: _obscureOldPassword,
                            validator: validatePassword,
                            decoration: InputDecoration(
                              labelText: 'Enter Old Password',
                              hintText: 'Enter Old Password',
                              suffixIcon: IconButton(
                                icon: Icon(_obscureNewPassword
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    _obscureOldPassword = !_obscureOldPassword;
                                  });
                                },
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                          ),
                          16.heightSpace,
                          TextFormField(
                            controller: cubit.newPasswordController,
                            obscureText: _obscureNewPassword,
                            validator: validatePassword,
                            decoration: InputDecoration(
                              labelText: 'Enter New Password',
                              hintText: 'Enter New Password',
                              suffixIcon: IconButton(
                                icon: Icon(_obscureNewPassword
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    _obscureNewPassword = !_obscureNewPassword;
                                  });
                                },
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                          ),
                          16.heightSpace,
                          // Confirm Password Field
                          TextFormField(
                            controller: cubit.confirmPasswordController,
                            obscureText: _obscureConfirmPassword,
                            validator: validatePassword,
                            decoration: InputDecoration(
                              labelText: 'Confirm Password',
                              hintText: 'Confirm Password',
                              suffixIcon: IconButton(
                                icon: Icon(_obscureConfirmPassword
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    _obscureConfirmPassword =
                                        !_obscureConfirmPassword;
                                  });
                                },
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                          ),
                        ],
                      )),
                  const SizedBox(height: 32),
                  // Update Password Button
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: (state is ResetPasswordLoadingState)
                        ? ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              // Handle login
                              // cubit.logIn();
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) => SignUpScreen(),
                              //     ));
                            },
                            child: const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.white,
                              ),
                            )

                            // Text(
                            //   "Login",
                            //   style: TextStyle(fontSize: 18, color: Colors.white),
                            // ),
                            )
                        : ElevatedButton(
                            onPressed: () {
                              if (cubit.resetPasswordFormKey.currentState!.validate()) {
                                cubit.resetPassword();
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                            child: const Text(
                              'Update Password',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    final passwordRegex = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,}$',
    );

    if (!passwordRegex.hasMatch(value)) {
      return 'Password must be at least 8 characters,\ninclude uppercase, lowercase, number, and special character';
    }

    return null; // Password is valid
  }
}
