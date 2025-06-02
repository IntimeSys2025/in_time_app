import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:in_time_app/features/account/presentation/screens/reset_password_screen.dart';

import '../../../home/presentation/screens/navigation_screen.dart';
import '../logic/create_account_cubit.dart';
import 'forget_password_screen.dart';

// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: OtpVerificationScreen(),
//   ));
// }

class OtpVerificationScreen extends StatefulWidget {
  final bool isFromForgetPassword;
  const OtpVerificationScreen({super.key, this.isFromForgetPassword = false});

  @override
  _OtpVerificationScreenState createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  int _secondsRemaining = 120; // 2 minutes countdown
  late Timer _timer;
  bool _isResendEnabled = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() => _secondsRemaining--);
      } else {
        _timer.cancel();
        setState(() => _isResendEnabled = true);
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')} min';
  }

  void _resendCode() {
    setState(() {
      _secondsRemaining = 120;
      _isResendEnabled = false;
    });
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<CreateAccountCubit>(context);
    return Scaffold(
      body: BlocConsumer<CreateAccountCubit, CreateAccountState>(
        listener: (context, state) {
          if (state is VerifyCodeFailureState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          } else if (state is VerifyCodeSuccessState) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ResetPasswordScreen(),
                ));
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                IconButton(
                  icon: const Icon(Icons.arrow_back, size: 28),
                  onPressed: () => Navigator.pop(context),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Enter Verification Code",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  "We have sent the code verification to",
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  cubit.forgetPasswordPhone?.completeNumber ?? '',
                  style: const TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                Center(
                  // child: Image.network(
                  //     'https://s3-alpha-sig.figma.com/img/bbcc/863f/24d8773f09528ce1a0f4d9d20bff9041?Expires=1745193600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=fFWIPy2KTaOSyOpWfzGLpeojUFZlDURkdzkhIwMP-INt1qvk4HWGdA9pAQ08UbTuzX5dptC6HPhiMbbn3viBSzAcCwJeyaKJ3UFFYEWY6bH175kxIbGs5Wyd9D-Qx76VvCPV~AyZpTsMHVEIXDnCqTG-MyNRVjyKCgHmE-PFYYFurLO2e8z9sMAwEgTZGgzNTmlu1vHxMBY217~8xua--U0WtgkiI8kuZ76lrwe1iRaWPY8~bmDMr0vjyRlOWVv2gCenetAhSU1R0KjtIABGh7GV2id5vkdM1ZKvV8Rj29ojWK6yhkCsSO-SCOfXr8mbb3upmCfuEZn5kmfInxbDMg__',
                  //     height: 200
                  // )
                  child: Image.asset(
                    'assets/images/otp.gif',
                    height: 200,
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child:
                  OtpTextField(
                    borderWidth: 2,
                    borderRadius: BorderRadius.circular(10),
                    numberOfFields: 6,
                    onSubmit: (value) {
                      debugPrint('OTP Submit : $value');
                      // createAccountCubit.otp = value;
                      // navigate to the next screen
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const EnterNationalIdScreen()));
                    },
                  ),
                  // Pinput(
                  //   length: 6,
                  //   defaultPinTheme: PinTheme(
                  //     width: 50,
                  //     height: 50,
                  //     textStyle: const TextStyle(
                  //         fontSize: 20, fontWeight: FontWeight.bold),
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(8),
                  //       border: Border.all(color: Colors.grey),
                  //     ),
                  //   ),
                  //   // validator: (value) {
                  //   //   if (value == null || value.isEmpty || value.length < 6) {
                  //   //     return 'Please enter the code';
                  //   //   }
                  //   //   return null;
                  //   // },
                  //   onCompleted: (pin) {},
                  // ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    _formatTime(_secondsRemaining),
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Center(
                  child: TextButton(
                    onPressed: () {
                      _isResendEnabled ? _resendCode : null;
                      if (_isResendEnabled) {
                        cubit.forgetPassword();
                      }
                    },
                    child: Text(
                      "Resend it",
                      style: TextStyle(
                          color: _isResendEnabled ? Colors.green : Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {
                      if (widget.isFromForgetPassword) {
                        cubit.verifyCode();
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NavigationBarScreen(),
                            ));
                      }
                    },
                    child: const Text("Verify",
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
