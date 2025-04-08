import 'package:flutter/material.dart';
import 'package:in_time_app/terms_privacy_screen.dart';

class EnterNewPasswordScreen extends StatefulWidget {
  const EnterNewPasswordScreen({super.key});

  @override
  State<EnterNewPasswordScreen> createState() => _EnterNewPasswordScreenState();
}

class _EnterNewPasswordScreenState extends State<EnterNewPasswordScreen> {
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;

  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text(''),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
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
              child: Image.network(
                'https://s3-alpha-sig.figma.com/img/7efe/52e5/189f8d3043a58d1706a8ba646761b853?Expires=1745193600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=hZUJYp125gluuQDbVFvcYIRiVfTXCrp90Mm23~0FnQv68ppPMpxhTLkuIzkoAEox-AtUQ23EZGcz0Ou469U6gwM3PPm-dbZ1A4vrafIRPqedquXqFBfUgn71bz-gEJsKa6os5dcxUI5EtN6BQg4RhUU7Ft6R3Z66HDDGhHCc0p0cVdzliprU-foMELNQ7sXoL1gcYcF9ZQq92BvbnOI1esl7kDNZMHlt6b0YlUdHUwrHiCp9vrJBh0qum9nGf2K6frrh-JpMGE~RpN0gyvXI8zdJXv8mmJg2adHw06SJxy21IHFRkNj0OsGBd6LVul9QAN9VYCsstULTT1l2Wm5aaQ__', // Replace with your asset
                height: 200,
              ),
            ),
            const SizedBox(height: 32),
            // New Password Field
            TextField(
              controller: _newPasswordController,
              obscureText: _obscureNewPassword,
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
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 16),
            // Confirm Password Field
            TextField(
              controller: _confirmPasswordController,
              obscureText: _obscureConfirmPassword,
              decoration: InputDecoration(
                labelText: 'Re-Enter Password',
                hintText: 'Re-Enter Password',
                suffixIcon: IconButton(
                  icon: Icon(_obscureConfirmPassword
                      ? Icons.visibility_off
                      : Icons.visibility),
                  onPressed: () {
                    setState(() {
                      _obscureConfirmPassword = !_obscureConfirmPassword;
                    });
                  },
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 32),
            // Update Password Button
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  // handle password update logic

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TermsScreen(
                          title: 'Terms & Conditions',
                          subtitle: 'Please read these terms of service, carefully before using our app operated by us.',
                          updatedDate: '05/02/2023',
                          heading: 'Conditions of Uses',
                          bulletPoints: [
                            'You must be at least 18 years old to use this app.',
                            'You agree to provide accurate and complete information when creating an account.',
                            'You are responsible for maintaining the confidentiality of your account and password.',
                            'You agree not to share your account with anyone else.',
                            'You are responsible for all activities that occur under your account.',
                          ],
                        ),
                      ));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text(
                  'Update Password',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
