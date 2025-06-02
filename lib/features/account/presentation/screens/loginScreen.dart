import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_time_app/core/utils/app_colors.dart';
import 'package:in_time_app/features/account/presentation/logic/create_account_cubit.dart';
import 'package:in_time_app/features/account/presentation/screens/forget_password_screen.dart';
import 'package:in_time_app/features/account/presentation/screens/signup_screen.dart';
import 'package:in_time_app/features/home/presentation/screens/home_screen_one_doctor.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../home/presentation/screens/navigation_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isVisiblePassword = true;
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<CreateAccountCubit>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: BlocConsumer<CreateAccountCubit, CreateAccountState>(
            listener: (context, state) {
              // if(state is SignInLoadingState){
              //   // Show loading indicator
              //   showDialog(
              //     context: context,
              //     barrierDismissible: false,
              //     builder: (context) => const Center(child: CircularProgressIndicator()),
              //   );
              //
              // }else
              if (state is SignInSuccessState) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NavigationBarScreen(),
                    ));
              } else if (state is SignInFailureState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.errorMessage),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            builder: (context, state) {
              // if (state is SignInLoadingState) {
              //   return const Center(
              //       child: CircularProgressIndicator(
              //     color: AppColors.transparent,
              //   ));
              //   // showDialog(
              //   //   context: context,
              //   //   barrierDismissible: false,
              //   //   builder: (context) => const Center(child: CircularProgressIndicator()),
              //   // );
              // } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 80),
                  // App Logo
                  Image.asset(
                    "assets/images/logo_green.png", // Replace with your actual logo asset
                    height: 80,
                  ),
                  const SizedBox(height: 20),

                  // Welcome Back Text
                  const Text(
                    "Welcome Back 👋",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),
                  const Text(
                    "Hello there, login to continue",
                    style: TextStyle(color: Colors.grey),
                  ),

                  const SizedBox(height: 15),
                  Row(
                    children: [
                      const Text("Didn’t have an account? "),
                      GestureDetector(
                        onTap: () {
                          // Handle register navigation
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpScreen(),
                              ));
                        },
                        child: const Text(
                          "Register",
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Mobile Number Field
                  // TextField(
                  //   keyboardType: TextInputType.phone,
                  //   decoration: InputDecoration(
                  //     labelText: "Mobile Number *",
                  //     prefixIcon: Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: Row(
                  //         mainAxisSize: MainAxisSize.min,
                  //         children: [
                  //           Image.asset(
                  //             "assets/saudi_flag.png", // Replace with country flag asset
                  //             height: 20,
                  //             width: 20,
                  //           ),
                  //           const SizedBox(width: 5),
                  //           const Text("+966"),
                  //         ],
                  //       ),
                  //     ),
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //   ),
                  // ),
                  Form(
                    key: cubit.loginForm,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              keyboardType: TextInputType.phone,
                              // countries: ["SA"],
                              onChanged: (phone) {
                                cubit.loginPhone = phone;
                              },
                            )),

                        const SizedBox(height: 15),

                        // Password Field
                        TextFormField(
                          controller: cubit.passwordController,
                          obscureText: isVisiblePassword?true:false,
                          validator: validatePassword,
                          decoration: InputDecoration(
                            labelText: "Password *",
                            suffixIcon:  IconButton(onPressed: (){
                              setState(() {
                                isVisiblePassword = ! isVisiblePassword;
                              });
                            }, icon: Icon(isVisiblePassword ?Icons.visibility_off:Icons.visibility)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Remember Me & Forgot Password
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            activeColor: AppColors.green,
                              value: cubit.rememberMe, onChanged: (value) {
                            cubit.changeRememberMeVal();
                            cubit.rememberMe = value!;
                          }),
                          const Text("Remember Me"),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          // Handle forgot password navigation
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgetPasswordScreen(),));
                        },
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Login Button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: (state is SignInLoadingState)
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
                    )
                        : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        // Handle login
                        if(cubit.loginForm.currentState!.validate()) {
                          // If the form is valid, proceed with login
                          cubit.logIn();
                        } else {
                          // If the form is invalid, show an error message
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please fill in all fields'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                        // cubit.logIn();
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => SignUpScreen(),
                        //     ));
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // Fingerprint Icon
                  // Center(
                  //   child: IconButton(
                  //     icon: const Icon(Icons.fingerprint,
                  //         size: 40, color: Colors.green),
                  //     onPressed: ()  {
                  //       // Handle fingerprint login
                  //     },
                  //   ),
                  // ),
                ],
              );
              // }
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
