import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/error/failure.dart';
import '../entities/user_entity.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, UserEntity>> signInWithEmail(
      String email, String password);
  Future<Either<Failure, UserEntity>> signUpWithEmail(
      String email, String password);
}

abstract class AuthenticationRepositoryFirebase
    extends AuthenticationRepository {
  Future<Either<Failure, UserCredential>> signInWithGoogle();
}
