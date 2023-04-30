import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user_entity.dart';
import '../repositories/authentication_repository.dart';

class SignUpFromRest implements UseCase<UserEntity, Params> {
  final AuthenticationRepository repository;
  SignUpFromRest(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(Params params) async {
    return await repository.signUpWithEmail(params.email, params.password);
  }
}
