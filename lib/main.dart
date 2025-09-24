import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_time_app/core/localization/app_localization.dart';
import 'package:in_time_app/core/service_locator/service_locator.dart';
import 'package:in_time_app/core/storage/secure_storage.dart';
import 'package:in_time_app/core/utils/app_asset_path.dart';
import 'package:in_time_app/core/utils/app_colors.dart';
import 'package:in_time_app/core/utils/app_constants.dart';
import 'package:in_time_app/features/account/presentation/logic/create_account_cubit.dart';
import 'package:in_time_app/features/home/presentation/logic/home_cubit.dart';
import 'package:in_time_app/features/home/presentation/screens/home_screen_one_doctor.dart';
import 'package:in_time_app/features/home/presentation/screens/navigation_screen.dart';
import 'core/observers/cubit_observer.dart';
import 'features/account/presentation/screens/loginScreen.dart';
import 'features/appointment/presentation/logic/appointment_cubit.dart';
import 'package:intl/date_symbol_data_local.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting();

  /// initialize easy localization
  await EasyLocalization.ensureInitialized();

  /// initialize service locator
  await ServiceLocator.init();

  /// Observer of All cubits
  if (!kReleaseMode) {
    Bloc.observer = MyBlocObserver();
  }

  AppConstants.isLoggedIn = await getBoolValue(key: 'loggedIn');
  AppConstants.token = (await getStringValue(key: 'token')) ?? '';
  AppConstants.fullName = await getStringValue(key: 'user_name') ?? '';

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
          ),
          BlocProvider(
            create: (context) => sl<HomeCubit>()
              ..getCategories()
              ..getPartners()
              ..getSliders()
              ..getServices(),
          ),
          BlocProvider(
            create: (context) =>
                sl<AppointmentCubit>()..getAvailableAppointments(1),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          // title: 'Flutter Demo',
          // theme: ThemeData(
          //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          //   useMaterial3: true,
          // ),
          home:
              // const NavigationBarScreen()

              FutureBuilder(
            future: Future.delayed(const Duration(seconds: 2)),
            builder: (context, snapshot) =>
                snapshot.connectionState == ConnectionState.done
                    ? const NavigationBarScreen()
                    : Container(
                        color: AppColors.white,
                        child: Center(
                          child: Image.asset('assets/images/logo_green.png'),
                        ),
                      ),
          ),
        ));
  }
}
