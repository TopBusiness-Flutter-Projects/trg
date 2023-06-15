import 'core/api/app_interceptors.dart';
import 'core/api/base_api_consumer.dart';
import 'core/api/dio_consumer.dart';
import 'core/remote/service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'features/employment/cubit/employment_cubit.dart';
import 'features/filter_providers/cubit/provider_filter_cubit.dart';
import 'features/home/cubit/home_cubit.dart';
import 'features/navigation_bottom/cubit/navigation_cubit.dart';
import 'features/onboarding/cubit/on_boarding_cubit.dart';
import 'features/search/cubit/provider_filter_cubit.dart';

final serviceLocator = GetIt.instance;

Future<void> setup() async {
  //! Features

  ///////////////////////// Blocs ////////////////////////
  serviceLocator.registerFactory(
    () => HomeCubit(serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => ProviderFilterCubit(serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => EmploymentCubit(serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => ProviderSearchCubit(serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => OnBoardingCubit(),
  );
  serviceLocator.registerFactory(
    () => NavigationCubit(),
  );

  ///////////////////////////////////////////////////////////////////////////////

  //! External
  // Shared Preferences
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPreferences);

  serviceLocator.registerLazySingleton(() => ServiceApi(serviceLocator()));

  serviceLocator.registerLazySingleton<BaseApiConsumer>(
      () => DioConsumer(client: serviceLocator()));
  serviceLocator.registerLazySingleton(() => AppInterceptors());

  // Dio
  serviceLocator.registerLazySingleton(
    () => Dio(
      BaseOptions(
        contentType: "application/x-www-form-urlencoded",
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      ),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true,
    ),
  );
}
