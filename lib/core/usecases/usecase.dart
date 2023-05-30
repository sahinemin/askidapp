import 'package:askidapp/core/error/failure.dart';
import 'package:askidapp/features/authentication/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, UserEntity>> call(Params params);
}

class Params extends Equatable {
  const Params(this.email, this.password);
  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}
