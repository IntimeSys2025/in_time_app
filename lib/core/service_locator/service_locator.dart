import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import '../network/api_consumer.dart';
import '../network/dio_consumer.dart';
import '../network/end_points.dart';
import '../network/network_status.dart';


final sl = GetIt.instance;

sealed class ServiceLocator {
  static Future<void> init() async {
    ///register cubits
    // sl.registerLazySingleton(() => WelcomeCubit());


    /// register use cases
    // sl.registerLazySingleton<GetAuctionsUseCase>(
    //     () => GetAuctionsUseCase(sl<HomeRepo>()));


    /// register Repositories
    // sl.registerLazySingleton<HomeRepo>(
    //   () => HomeRepoImpl(sl<HomeRemoteDataSourceImpl>(), sl<NetworkStatus>()),
    // );


    ///register Data Source
    // sl.registerLazySingleton<HomeRemoteDataSourceImpl>(
    //   () => HomeRemoteDataSourceImpl(sl<ApiConsumer>()),
    // );


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
