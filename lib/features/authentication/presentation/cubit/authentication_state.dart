part of 'authentication_cubit.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends AuthenticationState {
  const LoginInitial() : super();
}

class LoginLoading extends AuthenticationState {
  const LoginLoading() : super();
}

class LoginSuccessfull extends AuthenticationState {
  const LoginSuccessfull(this.userEntity) : super();
  final UserEntity userEntity;
}

class LoginError extends AuthenticationState {
  const LoginError(this.message) : super();
  final String message;
}
