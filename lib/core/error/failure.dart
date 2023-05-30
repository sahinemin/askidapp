// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure();
  @override
  List<Object> get props {
    return [];
  }

  @override
  bool get stringify => true;
}

class ServerFailure extends Failure {}

class ClientFailure extends Failure {}

class NetworkFailure extends Failure {}
