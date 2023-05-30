import 'package:askidapp/features/authentication/domain/entities/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_entity_model.g.dart';

@JsonSerializable()
class UserEntityModel extends UserEntity {
  const UserEntityModel({required super.email, required super.password});

  factory UserEntityModel.fromJson(Map<String, dynamic> json) =>
      _$UserEntityModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserEntityModelToJson(this);
}
