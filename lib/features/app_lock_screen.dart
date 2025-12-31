import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:in_time_app/features/home/presentation/screens/navigation_screen.dart';

import '../core/services/biometric_service.dart';

class AppLockScreen extends StatefulWidget {
  const AppLockScreen({super.key});

  @override
  State<AppLockScreen> createState() => _AppLockScreenState();
}

class _AppLockScreenState extends State<AppLockScreen> {
  final BiometricService _biometricService = BiometricService();

  @override
  void initState() {
    super.initState();
    _checkBiometric();
  }

  Future<void> _checkBiometric() async {
    final canAuth = await _biometricService.canAuthenticate();

    if (!canAuth) {
      _exitApp();
      return;
    }

    final success = await _biometricService.authenticate();

    if (success) {
      _goToHome();
    } else {
      _exitApp();
    }
  }

  void _goToHome() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const NavigationBarScreen()),
    );
  }

  void _exitApp() {
    SystemNavigator.pop();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(),
    );
  }
}
