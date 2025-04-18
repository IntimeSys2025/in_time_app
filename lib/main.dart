import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_time_app/core/localization/app_localization.dart';
import 'package:in_time_app/core/service_locator/service_locator.dart';
import 'package:in_time_app/core/utils/app_asset_path.dart';
import 'package:in_time_app/core/utils/app_colors.dart';
import 'package:in_time_app/features/account/presentation/logic/create_account_cubit.dart';

import 'core/observers/cubit_observer.dart';
import 'features/account/presentation/screens/loginScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// initialize easy localization
  await EasyLocalization.ensureInitialized();

  /// initialize service locator
  await ServiceLocator.init();

  /// Observer of All cubits
  if (!kReleaseMode) {
    Bloc.observer = MyBlocObserver();
  }
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
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => sl<CreateAccountCubit>(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          // title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: FutureBuilder(future: Future.delayed(Duration(seconds: 5)),
              builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.done
            ? const LoginScreen()
            :Container(color: AppColors.white,
            child: Center(
               child: Image.asset('assets/images/logo_green.png'),
            ),),),
        ));
  }
}
