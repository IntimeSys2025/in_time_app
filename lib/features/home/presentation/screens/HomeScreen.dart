import 'package:flutter/material.dart';
import 'package:in_time_app/core/storage/secure_storage.dart';

import '../../../account/presentation/screens/loginScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(child: Text('Log out'),
        onPressed: (){
          // Clear the secure storage
          saveBoolValue(key: 'loggedIn', value: false);
          // Navigate to login screen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
          );
        },),
      ),
    );
  }
}
