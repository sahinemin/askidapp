import 'package:equatable/equatable.dart';

class Token extends Equatable {
  const Token({
    this.token,
  });
  final String? token;

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [token];
}
