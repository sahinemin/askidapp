import 'dart:io';

import 'package:askidapp/core/error/exception.dart';
import 'package:askidapp/core/error/failure.dart';
import 'package:askidapp/core/platform/network_info.dart';
import 'package:askidapp/features/authentication/data/datasources/user_authentication_rest_data_source.dart';
import 'package:askidapp/features/authentication/domain/entities/user_entity.dart';
import 'package:askidapp/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:dartz/dartz.dart';

class RestAuthenticationReposityoryImpl implements AuthenticationRepository {
  const RestAuthenticationReposityoryImpl({
    required this.networkInfo,
    required this.restAuthentication,
  });

  final NetworkInfo networkInfo;
  final UserAuthenticationRestDataSource restAuthentication;

  @override
  Future<Either<Failure, UserEntity>> signInWithEmail(
    String email,
    String password,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await restAuthentication.signInWithEmail(email, password));
      } on ServerException {
        return Left(ServerFailure());
      } on SocketException {
        return Left(ClientFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signUpWithEmail(
    String email,
    String password,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await restAuthentication.signUpWithEmail(email, password));
      } on ServerException {
        return Left(ServerFailure());
      } on SocketException {
        return Left(ClientFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
