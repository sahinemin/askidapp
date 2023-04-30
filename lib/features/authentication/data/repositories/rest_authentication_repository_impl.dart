import 'package:askidapp/core/error/exception.dart';
import 'package:askidapp/features/authentication/domain/entities/user_entity.dart';
import 'package:askidapp/core/error/failure.dart';
import 'package:askidapp/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/platform/network_info.dart';
import '../datasources/user_authentication_rest_data_source.dart';

class RestAuthenticationReposityoryImpl implements AuthenticationRepository {
  final NetworkInfo networkInfo;
  final UserAuthenticationRestDataSource restAuthentication;

  const RestAuthenticationReposityoryImpl(
      {required this.networkInfo, required this.restAuthentication});

  @override
  Future<Either<Failure, UserEntity>> signInWithEmail(
      String email, String password) async {
    return await _authenticate((email, password) async =>
        await restAuthentication.signInWithEmail(email, password));
  }

  @override
  Future<Either<Failure, UserEntity>> signUpWithEmail(
      String email, String password) async {
    return await _authenticate((email, password) async =>
        await restAuthentication.signUpWithEmail(email, password));
  }

  Future<Either<Failure, UserEntity>> _authenticate(
      Future<UserEntity> Function(String email, String password)
          signInOrUp) async {
    if (await networkInfo.isConnected()) {
      try {
        final restUserAuth = await signInOrUp("email", "password");
        return Right(restUserAuth);
      } on ServerException {
        return const Left(ServerFailure("Not connected to internet"));
      }
    } else {
      return const Left(ConnectionFailure("Internet is not connnected"));
    }
  }
}
