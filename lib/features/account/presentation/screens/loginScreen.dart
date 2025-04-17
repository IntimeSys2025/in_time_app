import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:in_time_app/features/account/presentation/screens/signup_screen.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));
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
            Directionality(
                textDirection: TextDirection.ltr,
                child: Form(
                    // key: createAccountCubit.phoneNumberFormKey,
                    key: GlobalKey<FormState>(),
                    child: IntlPhoneField(
                      invalidNumberMessage: 'Invalid phone Number',
                      // controller: createAccountCubit.phoneController,
                      decoration: const InputDecoration(
                        // labelText: LocaleKeys.phoneNumber.tr(),
                        labelText: 'Phone Number',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                      ),
                      initialCountryCode: 'SA',
                      validator: (value) {
                        debugPrint('Val:: ${value?.completeNumber}');
                        // return createAccountCubit.validatePhoneNumber(value!);
                      },
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      onCountryChanged: (value) {
                        // createAccountCubit.countryCode = '+${value.fullCountryCode}';
                        debugPrint('Phone12: ${value.fullCountryCode}');
                      },
                      keyboardType: TextInputType.phone,
                      // countries: ["SA"],

                      onChanged: (phone) {
                        // createAccountCubit.countryCode = '';
                        // createAccountCubit.countryCode = phone.countryCode ;
                      },
                      onSubmitted: (v) {
                        // debugPrint('onSubmitted :: ${_phoneController.text}');
                        // createAccountCubit.verifyPhoneNumber();
                      },
                      onSaved: (v) {
                        // debugPrint('onSaved :: ${_phoneController.text}');
                      },
                    ))),

            const SizedBox(height: 15),

            // Password Field
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password *",
                suffixIcon: const Icon(Icons.visibility_off),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Remember Me & Forgot Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (value) {}),
                    const Text("Remember Me"),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    // Handle forgot password navigation
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
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  // Handle login
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));
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
        ),
      ),
    );
  }
}
