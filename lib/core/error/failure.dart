import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([List properties = const <dynamic>[]]);
  @override
  List<Object> get props => const <Object>[];
}

class ServerFailure extends Failure {
  final String message;

  const ServerFailure(this.message);
}

class ConnectionFailure extends Failure {
  final String message;

  const ConnectionFailure(this.message);
}
