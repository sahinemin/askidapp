import 'dart:convert';
import '../../domain/entities/user_entity.dart';

class UserEntityModel extends UserEntity {
  const UserEntityModel(
      {required super.userId,
      required super.email,
      required super.password,
      required super.imageUrl,
      required super.address,
      required super.name,
      required super.surname,
      required super.follower,
      required super.following,
      required super.phoneNumber});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'email': email,
      'password': password,
      'imageUrl': imageUrl,
      'address': address,
      'name': name,
      'surname': surname,
      'follower': follower.map((x) => x).toList(),
      'following': following.map((x) => x).toList(),
      'phoneNumber': phoneNumber,
    };
  }

  factory UserEntityModel.fromMap(Map<String, dynamic> map) {
    return UserEntityModel(
      userId: map['userId'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      imageUrl: map['imageUrl'] as String,
      address: map['address'] as String,
      name: map['name'] as String,
      surname: map['surname'] as String,
      follower: List<UserEntity>.from(
        (map['follower'] as List<int>).map<UserEntity>(
          (x) => UserEntityModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      following: List<UserEntity>.from(
        (map['following'] as List<int>).map<UserEntity>(
          (x) => UserEntityModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      phoneNumber: map['phoneNumber'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserEntityModel.fromJson(String source) =>
      UserEntityModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
