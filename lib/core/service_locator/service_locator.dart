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
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import '../../features/account/domain/use_cases/register_use_case.dart';
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

    /// register Repositories
    sl.registerLazySingleton<CreateAccountRepo>(
      () => CreateAccountRepoImpl(
          sl<CreateAccountDataSourceImpl>(), sl<NetworkStatus>()),
    );

    ///register Data Source
    sl.registerLazySingleton<CreateAccountDataSourceImpl>(
      () => CreateAccountDataSourceImpl(sl<ApiConsumer>()),
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
