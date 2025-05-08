import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_time_app/core/utils/app_colors.dart';
import 'package:in_time_app/features/account/presentation/logic/create_account_cubit.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'otp_verification_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // bool agreeToTerms = false;
  // bool agreeToPrivacy = false;
  // String gender = "Male";
  bool isVisiblePassword = false;
  bool isVisibleConfirmPassword = false;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<CreateAccountCubit>(context);
    return Scaffold(
      body: BlocConsumer<CreateAccountCubit, CreateAccountState>(
        buildWhen: (previous, current) => current is CreateAccountInitial||
        current is RegisterAccountLoadingState ||
            current is RegisterAccountSuccessState ||
            current is RegisterAccountFailureState,

        listener: (context, state) {
          if (state is RegisterAccountSuccessState) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OtpVerificationScreen(),
                ));
          }else if(state is RegisterAccountFailureState){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: Colors.red,
              ),
            );

          }
        },
       builder: (context, state) {
         return SingleChildScrollView(
           padding: const EdgeInsets.all(20),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               const SizedBox(height: 40),
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Image.asset("assets/images/logo_green.png", height: 60),
                   // Replace with your logo
                   const SizedBox(height: 10),
                   RichText(
                     text: const TextSpan(
                       text: "Welcome to ",
                       style: TextStyle(fontSize: 24, color: Colors.black),
                       children: [
                         TextSpan(
                           text: "inTime",
                           style: TextStyle(
                               fontWeight: FontWeight.bold, color: Colors.green),
                         ),
                       ],
                     ),
                   ),
                   const SizedBox(height: 5),
                   const Text("Hello there, Sign Up to continue",
                       style: TextStyle(color: Colors.grey)),
                 ],
               ),
               const SizedBox(height: 20),
               Form(
                 key: cubit.phoneNumberFormKey,
                 child: Column(
                   children: [
                     Row(
                       children: [
                         Expanded(
                             child: _buildTextField(
                                 controller: cubit.firstNameController,
                                 // onChanged: (value) {
                                 //
                                 // },
                                 "First name",
                                 "Enter your first name",
                                 inputFormatters: [
                                   FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
                                   LengthLimitingTextInputFormatter(30),
                                 ])),
                         const SizedBox(width: 10),
                         Expanded(
                             child: _buildTextField(
                                 controller: cubit.lastNameController,
                                 "Last name",
                                 "Enter your last name",
                                 inputFormatters: [
                                   FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
                                   LengthLimitingTextInputFormatter(30),
                                 ])),
                       ],
                     ),
                     const SizedBox(height: 20),
                     // _buildTextField("Mobile Number", "+966 XXX XXX XXXX"),
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
                           // countries: [],
                           validator: (value) {
                             if(value == null || value.number.isEmpty) {
                               return 'Please enter a valid phone number';
                             }
                             debugPrint('Val:: ${value?.completeNumber}');
                             return null;
                             // return createAccountCubit.validatePhoneNumber(value!);
                           },
                           inputFormatters: [
                             FilteringTextInputFormatter.digitsOnly
                           ],
                           keyboardType: TextInputType.phone,
                           // countries: ["SA"],
                           onChanged: (phone) {
                             cubit.signUpPhone = phone;
                           },
                         )),
                     const SizedBox(height: 10),
                     _buildTextField(isVisible: isVisiblePassword, onPressed: () {
                       setState(() {
                         isVisiblePassword = !isVisiblePassword;
                       });
                     },
                         controller: cubit.passwordSignUpController,
                         "Password",
                         "Enter your password",
                         isPassword: true,
                         inputFormatters:  [
                           FilteringTextInputFormatter.allow(RegExp(r'.*')), // Accepts anything
                         ]
                     ),
                     const SizedBox(height: 10),
                     _buildTextField("Confirm Password", "Enter your password",
                         isPassword: true,
                         onPressed: () {
                           setState(() {
                             isVisibleConfirmPassword = !isVisibleConfirmPassword;
                           });
                         },
                         isVisible: isVisibleConfirmPassword,
                         controller: cubit.confirmPasswordController,
                         inputFormatters:  [
                           FilteringTextInputFormatter.allow(RegExp(r'.*')), // Accepts anything
                         ]),
                   ],
                 ),
               ),

               const SizedBox(height: 10),
               Directionality(
                   textDirection: TextDirection.ltr,
                   child: IntlPhoneField(
                     invalidNumberMessage: 'Invalid phone Number',
                     decoration: const InputDecoration(
                       labelText: 'Additional Phone Number',
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
                       cubit.signUpAdditionalPhone = phone;
                     },
                   )),
               const SizedBox(height: 10),

               // Gender Selection
               const Text("Gender",
                   style: TextStyle(fontWeight: FontWeight.bold)),
               Row(
                 children: [
                   _buildRadioButton("male"),
                   _buildRadioButton("female"),
                 ],
               ),
               const SizedBox(height: 10),

               _buildTextField("Date of birth", "Enter your Date Of Birth",
                   isDatePicker: true, controller: cubit.dateOfBirthController),
               const SizedBox(height: 10),

               // Terms and Privacy Checkboxes
               Row(
                 children: [
                   Checkbox(
                     value: cubit.termsAccepted,
                     onChanged: (value) =>
                         setState(() => cubit.termsAccepted = value!),
                   ),
                   const Text("I agree to the "),
                   const Text("Terms & Conditions",
                       style: TextStyle(
                           color: Colors.green, fontWeight: FontWeight.bold)),
                 ],
               ),
               Row(
                 children: [
                   Checkbox(
                     value: cubit.privacyAccepted,
                     onChanged: (value) =>
                         setState(() => cubit.privacyAccepted = value!),
                   ),
                   const Text("I agree to the "),
                   const Text("Privacy Policy",
                       style: TextStyle(
                           color: Colors.green, fontWeight: FontWeight.bold)),
                 ],
               ),
               const SizedBox(height: 20),

               // Sign Up Button with Fingerprint Icon
               SizedBox(
                 width: double.infinity,
                 height: 50,
                 child: (state is RegisterAccountLoadingState)?ElevatedButton(
                   style: ElevatedButton.styleFrom(
                       backgroundColor: Colors.green,
                       shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(10))),
                   onPressed: () {
                     // cubit.register();
                   },
                   child: Center(
                     child: CircularProgressIndicator(
                       color: AppColors.white,
                     ),
                   ),
                 ):ElevatedButton(
                   style: ElevatedButton.styleFrom(
                       backgroundColor: Colors.green,
                       shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(10))),
                   onPressed: () {
                     if(cubit.phoneNumberFormKey.currentState!.validate()){
                       cubit.register();
                     }

                   },
                   child: const Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text("Sign Up",
                           style: TextStyle(fontSize: 18, color: Colors.white)),
                       SizedBox(width: 10),
                       // Icon(Icons.fingerprint, color: Colors.white),
                     ],
                   ),
                 ),
               ),
               const SizedBox(height: 20),
             ],
           ),
         );
       },
      ),
    );
  }

  Widget _buildTextField(String label, String hintText,
      {bool isPassword = false,
      bool isDatePicker = false,
      required TextEditingController controller,
      bool isVisible = false,
      Function()? onPressed,
      List<TextInputFormatter>? inputFormatters
      // required Function(dynamic value) onChanged
      }) {
    final cubit = BlocProvider.of<CreateAccountCubit>(context);
    return TextFormField(
      controller: controller,
      inputFormatters: inputFormatters,
      // onChanged:onChanged,
      onTap: () async {
        if (isDatePicker) {
          final DateTime? date = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
          );
          cubit.setDateOfBirth(date ?? DateTime.now());
          // cubit.dateOfBirthController.text = date.toString();
          // debugPrint('Date:: $date ,, ${date.runtimeType}');
        }
      },
      validator: isPassword ? validatePassword :(value) {
        if (isPassword) {
          debugPrint('ValPass:: ${validatePassword(value)}');
          return validatePassword(value);
        }else{
          if (value == null || value.isEmpty) {
            return hintText;
          }
          return null;
        }

      },
      obscureText: isPassword && !isVisible,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        suffixIcon: isPassword
            ? IconButton(
                onPressed: onPressed ?? () {},
                icon: Icon(
                  isVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ))
            : isDatePicker
                ? const Icon(Icons.calendar_today)
                : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  Widget _buildRadioButton(String value) {
    final cubit = BlocProvider.of<CreateAccountCubit>(context);
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: cubit.gender,
          onChanged: (newValue) =>
              setState(() => cubit.gender = newValue as String),
        ),
        Text(value),
      ],
    );
  }
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    final passwordRegex = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,}$',
    );

    if (!passwordRegex.hasMatch(value) || value.contains('#')) {
      return 'Password must be at least 8 characters,\ninclude uppercase, lowercase, number, and special character';
    }

    return null; // Password is valid
  }

}
