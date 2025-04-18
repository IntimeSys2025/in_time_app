import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:in_time_app/core/localization/app_localization.dart';
import 'package:in_time_app/core/utils/app_asset_path.dart';

import 'features/account/presentation/screens/loginScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: AppLocalization.locales,
      path: AppAsset.translations,
      fallbackLocale: AppLocalization.locales[1],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
