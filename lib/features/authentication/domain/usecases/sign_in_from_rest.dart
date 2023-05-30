import 'package:askidapp/core/error/failure.dart';
import 'package:askidapp/core/usecases/usecase.dart';
import 'package:askidapp/features/authentication/domain/entities/user_entity.dart';
import 'package:askidapp/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:dartz/dartz.dart';

class SignInFromRest implements UseCase<UserEntity, Params> {
  SignInFromRest(this.repository);
  final AuthenticationRepository repository;

  @override
  Future<Either<Failure, UserEntity>> call(Params params) async {
    return repository.signInWithEmail(params.email, params.password);
  }
}
