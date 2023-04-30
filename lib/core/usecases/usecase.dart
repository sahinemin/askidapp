import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../features/authentication/domain/entities/user_entity.dart';
import '../error/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, UserEntity>> call(Params params);
}

class Params extends Equatable {
  final String email;
  final String password;

  const Params(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}
