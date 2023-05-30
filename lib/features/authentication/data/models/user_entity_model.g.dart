// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEntityModel _$UserEntityModelFromJson(Map<String, dynamic> json) =>
    UserEntityModel(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$UserEntityModelToJson(UserEntityModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
