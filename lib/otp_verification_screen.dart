import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import 'enter_password_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: OtpVerificationScreen(),
  ));
}

class OtpVerificationScreen extends StatefulWidget {
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
    return Scaffold(
      body: Padding(
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
            const Text(
              "+020*******001",
              style:
                  TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            Center(
                child: Image.network(
                    'https://s3-alpha-sig.figma.com/img/bbcc/863f/24d8773f09528ce1a0f4d9d20bff9041?Expires=1745193600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=fFWIPy2KTaOSyOpWfzGLpeojUFZlDURkdzkhIwMP-INt1qvk4HWGdA9pAQ08UbTuzX5dptC6HPhiMbbn3viBSzAcCwJeyaKJ3UFFYEWY6bH175kxIbGs5Wyd9D-Qx76VvCPV~AyZpTsMHVEIXDnCqTG-MyNRVjyKCgHmE-PFYYFurLO2e8z9sMAwEgTZGgzNTmlu1vHxMBY217~8xua--U0WtgkiI8kuZ76lrwe1iRaWPY8~bmDMr0vjyRlOWVv2gCenetAhSU1R0KjtIABGh7GV2id5vkdM1ZKvV8Rj29ojWK6yhkCsSO-SCOfXr8mbb3upmCfuEZn5kmfInxbDMg__',
                    height: 200
                )),
            const SizedBox(height: 30),
            Center(
              child: Pinput(
                length: 6,
                defaultPinTheme: PinTheme(
                  width: 50,
                  height: 50,
                  textStyle: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey),
                  ),
                ),
                onCompleted: (pin) {
                  print("Entered OTP: $pin");
                },
              ),
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
                onPressed: _isResendEnabled ? _resendCode : null,
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => EnterNewPasswordScreen(),));
                },
                child: const Text("Verify",
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
