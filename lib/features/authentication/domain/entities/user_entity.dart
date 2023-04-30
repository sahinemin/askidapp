import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class UserEntity extends Equatable {
  final String userId;
  final String email;
  final String password;
  final String imageUrl;
  final String address;
  final String name;
  final String surname;
  final List<UserEntity> follower;
  final List<UserEntity> following;
  final String phoneNumber;
  const UserEntity({
    required this.userId,
    required this.email,
    required this.password,
    required this.imageUrl,
    required this.address,
    required this.name,
    required this.surname,
    required this.follower,
    required this.following,
    required this.phoneNumber,
  });

  @override
  List<Object?> get props => [
        userId,
        email,
        password,
        imageUrl,
        address,
        name,
        surname,
        follower,
        following,
        phoneNumber
      ];
        @override
  String toString() {
    return 'UserEntity(userId: $userId, email: $email, password: $password, imageUrl: $imageUrl, address: $address, name: $name, surname: $surname, follower: $follower, following: $following, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(covariant UserEntity other) {
    if (identical(this, other)) return true;

    return other.userId == userId &&
        other.email == email &&
        other.password == password &&
        other.imageUrl == imageUrl &&
        other.address == address &&
        other.name == name &&
        other.surname == surname &&
        listEquals(other.follower, follower) &&
        listEquals(other.following, following) &&
        other.phoneNumber == phoneNumber;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
        email.hashCode ^
        password.hashCode ^
        imageUrl.hashCode ^
        address.hashCode ^
        name.hashCode ^
        surname.hashCode ^
        follower.hashCode ^
        following.hashCode ^
        phoneNumber.hashCode;
  }
}
