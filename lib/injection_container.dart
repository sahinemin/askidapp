import 'package:askidapp/core/client/app_client.dart';
import 'package:askidapp/core/platform/network_info.dart';
import 'package:askidapp/features/authentication/data/datasources/user_authentication_rest_data_source.dart';
import 'package:askidapp/features/authentication/data/repositories/rest_authentication_repository_impl.dart';
import 'package:askidapp/features/authentication/data/service/authentication_service.dart';
import 'package:askidapp/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:askidapp/features/authentication/domain/usecases/sign_in_from_rest.dart';
import 'package:askidapp/features/authentication/domain/usecases/sign_up_from_rest.dart';
import 'package:askidapp/features/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.I;

Future<void> init() async {
  sl
    ..registerFactory(
      () => AuthenticationCubit(sl(), sl()),
    )
    ..registerLazySingleton(() => SignInFromRest(sl()))
    ..registerLazySingleton(() => SignUpFromRest(sl()))
    ..registerLazySingleton<AuthenticationRepository>(
      () => RestAuthenticationReposityoryImpl(
        networkInfo: sl(),
        restAuthentication: sl(),
      ),
    )
    ..registerLazySingleton<UserAuthenticationRestDataSource>(
      () => UserAuthenticationRestDataSourceImpl(sl()),
    )
    ..registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()))
    ..registerSingleton(
      AppClient().getService<AuthenticationService>(),
    )
    ..registerLazySingleton(Connectivity.new);
}
