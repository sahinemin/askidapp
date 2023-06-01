import 'package:askidapp/core/error/failure.dart';
import 'package:askidapp/features/authentication/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, UserEntity>> call(Params params);
}

class Params extends Equatable {
  const Params(
    this.email,
    this.password,
  );
  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}

class ParamsForRegister extends Params {
  const ParamsForRegister(
    this.firstName,
    this.lastName,
    super.email,
    super.password,
  );
  final String firstName;
  final String lastName;

  @override
  List<Object?> get props => [super.email, super.password, firstName, lastName];
}
