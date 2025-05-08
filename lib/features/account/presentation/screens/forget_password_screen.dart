import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_time_app/core/utils/app_asset_path.dart';
import 'package:in_time_app/core/utils/app_colors.dart';
import 'package:in_time_app/features/account/presentation/logic/create_account_cubit.dart';
import 'package:in_time_app/features/account/presentation/screens/otp_verification_screen.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  // bool _obscureNewPassword = true;
  // bool _obscureConfirmPassword = true;

  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cubit =BlocProvider.of<CreateAccountCubit>(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      // appBar: AppBar(
      //   leading: const BackButton(),
      //   title: const Text(''),
      //   elevation: 0,
      //   backgroundColor: Colors.white,
      // ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: SafeArea(
          child: BlocConsumer<CreateAccountCubit,CreateAccountState>(
            listener: (context, state) {
              if(state is ForgetPasswordFailureState){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.errorMessage),
                    backgroundColor: Colors.red,
                  ),
                );
              }else if(state is ForgetPasswordSuccessState){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.successMessage),
                    backgroundColor: Colors.green,
                  ),
                );
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OtpVerificationScreen(isFromForgetPassword: true,),
                    ));

              }

          },
            buildWhen: (previous, current) => current is ForgetPasswordLoadingState||
            current is ForgetPasswordSuccessState || current is ForgetPasswordFailureState,
          builder:(context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Enter Your Phone Number',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Please enter your phone number to reset your password',
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
                        cubit.forgetPasswordPhone = phone;
                      },
                    )),
                const SizedBox(height: 32),
                // Update Password Button
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: (state is ForgetPasswordLoadingState)
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
                      child:  const Center(
                        child: CircularProgressIndicator(color: AppColors.white,),
                      )

                    // Text(
                    //   "Login",
                    //   style: TextStyle(fontSize: 18, color: Colors.white),
                    // ),
                  ):ElevatedButton(
                    onPressed: () {
                      // handle password update logic
                      cubit.forgetPassword();
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => const TermsScreen(
                      //         title: 'Terms & Conditions',
                      //         subtitle: 'Please read these terms of service, carefully before using our app operated by us.',
                      //         updatedDate: '05/02/2023',
                      //         heading: 'Conditions of Uses',
                      //         bulletPoints: [
                      //           'You must be at least 18 years old to use this app.',
                      //           'You agree to provide accurate and complete information when creating an account.',
                      //           'You are responsible for maintaining the confidentiality of your account and password.',
                      //           'You agree not to share your account with anyone else.',
                      //           'You are responsible for all activities that occur under your account.',
                      //         ],
                      //       ),
                      //     ));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text(
                      'Confirm',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ],
            );
          }, ),
        ),
      ),
    );
  }
}
