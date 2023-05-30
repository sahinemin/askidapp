import 'dart:convert';

import 'package:askidapp/core/decoder.dart';
import 'package:askidapp/core/error/exception.dart';
import 'package:askidapp/features/authentication/data/models/token_model.dart';
import 'package:askidapp/features/authentication/data/models/user_entity_model.dart';
import 'package:askidapp/features/authentication/data/service/authentication_service.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

abstract class UserAuthenticationRestDataSource {
  Future<UserEntityModel> signInWithEmail(String email, String password);
  Future<UserEntityModel> signUpWithEmail(String email, String password);
}

class UserAuthenticationRestDataSourceImpl
    implements UserAuthenticationRestDataSource {
  UserAuthenticationRestDataSourceImpl(this.authenticationService);

  final AuthenticationService authenticationService;

  @override
  Future<UserEntityModel> signInWithEmail(String email, String password) async {
    final response = await authenticationService.signIn(
      json.encode(
        {
          'email': email,
          'password': password,
        },
      ),
    );
    if (response.isSuccessful) {
      final token =
          TokenModel.fromJson(Decoder.instance.jsonDecode(response.body!));
      final decodedToken = JwtDecoder.decode(token.token!);
      print(decodedToken);
      return UserEntityModel(email: email, password: password);
    } else {
      throw const ServerException();
    }
  }

  @override
  Future<UserEntityModel> signUpWithEmail(String email, String password) async {
    final response = await authenticationService.signUp();
    if (response.isSuccessful) {
      return UserEntityModel.fromJson(
        Decoder.instance.jsonDecode(response.body!),
      );
    } else {
      throw const ServerException();
    }
  }
}
