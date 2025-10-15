import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:in_time_app/features/account/data/data_source/create_account_data_source.dart';
import 'package:in_time_app/features/account/data/repositories/create_account_repo_impl.dart';
import 'package:in_time_app/features/account/domain/repositories/create_account_repo.dart';
import 'package:in_time_app/features/account/domain/use_cases/forget_password_use_case.dart';
import 'package:in_time_app/features/account/domain/use_cases/login_use_case.dart';
import 'package:in_time_app/features/account/domain/use_cases/reset_password.dart';
import 'package:in_time_app/features/account/domain/use_cases/verify_code_use_case.dart';
import 'package:in_time_app/features/account/presentation/logic/create_account_cubit.dart';
import 'package:in_time_app/features/appointment/presentation/logic/appointment_cubit.dart';
import 'package:in_time_app/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:in_time_app/features/home/data/repositories/home_repo_impl.dart';
import 'package:in_time_app/features/home/domain/repositories/home_repo.dart';
import 'package:in_time_app/features/home/domain/use_cases/appointments_use_case.dart';
import 'package:in_time_app/features/home/domain/use_cases/get_categories_use_case.dart';
import 'package:in_time_app/features/home/domain/use_cases/get_partner_details_use_case.dart';
import 'package:in_time_app/features/home/domain/use_cases/get_partners_use_case.dart';
import 'package:in_time_app/features/home/domain/use_cases/get_services_use_case.dart';
import 'package:in_time_app/features/home/domain/use_cases/get_slider_use_case.dart';
import 'package:in_time_app/features/home/domain/use_cases/sub_service_use_case.dart';
import 'package:in_time_app/features/profile/data/data_source/profile_remote_data_source.dart';
import 'package:in_time_app/features/profile/data/repositories/profile_repo_impl.dart';
import 'package:in_time_app/features/profile/domain/repositories/profile_repo.dart';
import 'package:in_time_app/features/profile/domain/use_case/get_help_center_use_case.dart';
import 'package:in_time_app/features/profile/domain/use_case/get_privacy_use_case.dart';
import 'package:in_time_app/features/profile/domain/use_case/get_terms_use_case.dart';
import 'package:in_time_app/features/profile/presentation/logic/profile_cubit.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import '../../features/account/domain/use_cases/register_use_case.dart';
import '../../features/home/domain/use_cases/get_appointment_in_date.dart';
import '../../features/home/presentation/logic/home_cubit.dart';
import '../network/api_consumer.dart';
import '../network/dio_consumer.dart';
import '../network/end_points.dart';
import '../network/network_status.dart';

final sl = GetIt.instance;

sealed class ServiceLocator {
  static Future<void> init() async {
    ///register cubits
    sl.registerLazySingleton(() => CreateAccountCubit(
        sl<RegisterUseCase>(),
        sl<LoginUseCase>(),
        sl<ForgetPasswordUseCas>(),
        sl<VerifyCodeUseCas>(),
        sl<ResetPasswordUseCas>()));

    sl.registerLazySingleton(() => HomeCubit(
        sl<GetCategoriesUseCase>(),
        sl<GetSliderUseCase>(),
        sl<GetServiceUseCase>(),
        sl<SubServiceUseCase>(),
        sl<AppointmentsUseCas>(),
        sl<PartnersUseCase>(),
        sl<PartnerDetailsUseCase>()));
    sl.registerLazySingleton(
      () => AppointmentCubit(
          sl<AppointmentsUseCas>(), sl<GetAvailableTimesInDateUseCase>()),
    );
    sl.registerLazySingleton(() => ProfileCubit(sl<TermsConditionsUseCase>(),
        sl<PrivacyPolicyUseCase>(), sl<HelpCenterUseCase>()));

    /// register use cases
    sl.registerLazySingleton<RegisterUseCase>(
        () => RegisterUseCase(sl<CreateAccountRepo>()));
    sl.registerLazySingleton<LoginUseCase>(
        () => LoginUseCase(sl<CreateAccountRepo>()));
    sl.registerLazySingleton(
      () => ForgetPasswordUseCas(sl<CreateAccountRepo>()),
    );
    sl.registerLazySingleton(
      () => VerifyCodeUseCas(sl<CreateAccountRepo>()),
    );
    sl.registerLazySingleton(
      () => ResetPasswordUseCas(sl<CreateAccountRepo>()),
    );
    sl.registerLazySingleton(() => GetCategoriesUseCase(sl<HomeRepo>()));
    sl.registerLazySingleton(() => GetSliderUseCase(sl<HomeRepo>()));

    sl.registerLazySingleton(() => GetServiceUseCase(sl<HomeRepo>()));
    sl.registerLazySingleton(() => SubServiceUseCase(sl<HomeRepo>()));
    sl.registerLazySingleton(() => AppointmentsUseCas(sl<HomeRepo>()));
    sl.registerLazySingleton(
        () => GetAvailableTimesInDateUseCase(sl<HomeRepo>()));
    sl.registerLazySingleton(() => PartnersUseCase(sl<HomeRepo>()));
    sl.registerLazySingleton(() => PartnerDetailsUseCase(sl<HomeRepo>()));
    sl.registerLazySingleton(
      () => TermsConditionsUseCase(sl<ProfileRepo>()),
    );
    sl.registerLazySingleton(
      () => PrivacyPolicyUseCase(sl<ProfileRepo>()),
    );
    sl.registerLazySingleton(
      () => HelpCenterUseCase(sl<ProfileRepo>()),
    );

    /// register Repositories
    sl.registerLazySingleton<CreateAccountRepo>(
      () => CreateAccountRepoImpl(
          sl<CreateAccountDataSourceImpl>(), sl<NetworkStatus>()),
    );
    sl.registerLazySingleton<HomeRepo>(() =>
        HomeRepoImpl(sl<HomeRemoteDataSourceImpl>(), sl<NetworkStatus>()));
    sl.registerLazySingleton<ProfileRepo>(() => ProfileRepoImpl(
        sl<ProfileRemoteDataSourceImpl>(), sl<NetworkStatus>()));

    ///register Data Source
    sl.registerLazySingleton<CreateAccountDataSourceImpl>(
      () => CreateAccountDataSourceImpl(sl<ApiConsumer>()),
    );
    sl.registerLazySingleton<HomeRemoteDataSourceImpl>(
        () => HomeRemoteDataSourceImpl(sl<ApiConsumer>()));
    sl.registerLazySingleton<ProfileRemoteDataSourceImpl>(
      () => ProfileRemoteDataSourceImpl(sl<ApiConsumer>()),
    );

    /// Core
    sl.registerLazySingleton<NetworkStatus>(() => NetworkStatusImpl(sl()));
    sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(EndPoints.baseUrl));

    /// External
    sl.registerLazySingleton<Dio>(() => Dio());
    sl.registerLazySingleton<InternetConnection>(() =>
        InternetConnection.createInstance(customCheckOptions: [
          InternetCheckOption(uri: Uri.parse(EndPoints.baseUrl))
        ], useDefaultOptions: false));
  }
}
