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
import 'package:in_time_app/features/account/presentation/screens/scan_qr_screen.dart';
import 'package:in_time_app/features/app_lock_screen.dart';
import 'package:in_time_app/features/home/presentation/logic/home_cubit.dart';
import 'package:in_time_app/features/home/presentation/screens/home_screen_one_doctor.dart';
import 'package:in_time_app/features/home/presentation/screens/navigation_screen.dart';
import 'package:in_time_app/features/profile/presentation/logic/profile_cubit.dart';
import 'core/observers/cubit_observer.dart';
import 'core/services/biometric_service.dart';
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
  AppConstants.userToken = (await getStringValue(key: 'token')) ?? '';
  AppConstants.fullName = await getStringValue(key: 'user_name') ?? '';
  AppConstants.userMobile = await getStringValue(key: 'mobile') ?? '';
  AppConstants.additionalMobile =
      await getStringValue(key: 'additional_mobile') ?? '';
  AppConstants.dateOfBirth = await getStringValue(key: 'date_of_birth') ?? '';

  runApp(EasyLocalization(
      supportedLocales: AppLocalization.locales,
      path: AppAsset.translations,
      fallbackLocale: AppLocalization.locales[1],
      child: const MyApp()));

  // if(AppConstants.userToken != '' ){
  //
  // }

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
                // ..getCategories()
                ..getPartners()
              // ..getSliders()
              // ..getServices(),
              ),
          BlocProvider(
            create: (context) =>
                sl<AppointmentCubit>()..getAvailableAppointments(1),
          ),
          BlocProvider(
            create: (context) => sl<ProfileCubit>(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          // title: 'Flutter Demo',
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.white,
            colorScheme:
                ColorScheme.fromSeed(seedColor: AppColors.kGreenButton),
            useMaterial3: true,
          ),
          home:
              // const NavigationBarScreen()

              FutureBuilder(
            future: Future.delayed(const Duration(seconds: 2)),
            builder: (context, snapshot) =>
                snapshot.connectionState == ConnectionState.done
                    ? AppConstants.userToken != ''?
                    const AppLockScreen()
                    // :const NavigationBarScreen()
                    :const ScanQRScreen()
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
