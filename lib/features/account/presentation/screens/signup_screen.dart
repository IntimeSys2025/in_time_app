import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_time_app/features/account/presentation/logic/create_account_cubit.dart';

import 'otp_verification_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool agreeToTerms = false;
  bool agreeToPrivacy = false;
  String gender = "Male";

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<CreateAccountCubit>(context);
    return Scaffold(
      body: BlocListener<CreateAccountCubit, CreateAccountState>(
        listener: (context, state) {
          if (state is CreateAccountSuccess) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OtpVerificationScreen(),
                ));
          }
        },
        child: SingleChildScrollView(
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
                                "First name", "Enter your mail")),
                        const SizedBox(width: 10),
                        Expanded(
                            child: _buildTextField(
                                "Last name", "Enter your mail")),
                      ],
                    ),
                    const SizedBox(height: 10),
                    _buildTextField("Mobile Number", "+966 XXX XXX XXXX"),
                    const SizedBox(height: 10),
                    _buildTextField("Password", "Enter your password",
                        isPassword: true),
                    const SizedBox(height: 10),
                    _buildTextField("Confirm Password", "Enter your password",
                        isPassword: true),
                  ],
                ),
              ),

              const SizedBox(height: 10),
              _buildTextField("Additional Mobile Number", "+966 XXX XXX XXXX"),
              const SizedBox(height: 10),

              // Gender Selection
              const Text("Gender",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Row(
                children: [
                  _buildRadioButton("Male"),
                  _buildRadioButton("Female"),
                ],
              ),
              const SizedBox(height: 10),

              _buildTextField("Date of birth", "Enter your Date Of Birth",
                  isDatePicker: true),
              const SizedBox(height: 10),

              // Terms and Privacy Checkboxes
              Row(
                children: [
                  Checkbox(
                    value: agreeToTerms,
                    onChanged: (value) => setState(() => agreeToTerms = value!),
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
                    value: agreeToPrivacy,
                    onChanged: (value) =>
                        setState(() => agreeToPrivacy = value!),
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
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {
                    cubit.register();
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
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hintText,
      {bool isPassword = false, bool isDatePicker = false}) {
    final cubit = BlocProvider.of<CreateAccountCubit>(context);
    return TextFormField(
      onTap: () {
        if (isDatePicker) {
          showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
          );
        }
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter your $label";
        }
        return null;
      },
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        suffixIcon: isPassword
            ? const Icon(Icons.visibility_off)
            : isDatePicker
                ? const Icon(Icons.calendar_today)
                : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  Widget _buildRadioButton(String value) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: gender,
          onChanged: (newValue) => setState(() => gender = newValue as String),
        ),
        Text(value),
      ],
    );
  }
}
