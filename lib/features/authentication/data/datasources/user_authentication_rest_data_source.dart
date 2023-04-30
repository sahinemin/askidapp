import 'dart:convert';
import 'package:askidapp/core/error/exception.dart';
import 'package:askidapp/features/authentication/data/models/user_entity_model.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

abstract class UserAuthenticationRestDataSource {
  Future<UserEntityModel> signInWithEmail(String email, String password);
  Future<UserEntityModel> signUpWithEmail(String email, String password);
}

class UserAuthenticationRestDataSourceImpl
    implements UserAuthenticationRestDataSource {
  late final Response response;

  @override
  Future<UserEntityModel> signInWithEmail(String email, String password) async {
    response = await http.get(
      Uri.parse('http://localhost:8080/api/v1/login'),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      return UserEntityModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException(response.statusCode.toString());
    }
  }

  @override
  Future<UserEntityModel> signUpWithEmail(String email, String password) async {
    response = await http.get(
      Uri.parse('http://localhost:8080/api/v1/register'),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      return UserEntityModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException(response.statusCode.toString());
    }
  }
}
