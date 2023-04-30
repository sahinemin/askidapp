import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user_entity.dart';
import '../repositories/authentication_repository.dart';

class SignInFromRest implements UseCase<UserEntity, Params> {
  final AuthenticationRepository repository;
  SignInFromRest(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(Params params) async {
    return await repository.signInWithEmail(params.email, params.password);
  }
}
