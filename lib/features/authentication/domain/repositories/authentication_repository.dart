import 'package:askidapp/core/error/failure.dart';
import 'package:askidapp/features/authentication/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, UserEntity>> signInWithEmail(
    String email,
    String password,
  );
  Future<Either<Failure, UserEntity>> signUpWithEmail(
    String email,
    String password,
  );
}

abstract class AuthenticationRepositoryFirebase
    extends AuthenticationRepository {
  Future<Either<Failure, UserCredential>> signInWithGoogle();
}
