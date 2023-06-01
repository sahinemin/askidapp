import 'dart:async';
import 'package:chopper/chopper.dart';
part 'authentication_service.chopper.dart';

@ChopperApi(baseUrl: '/auth')
abstract class AuthenticationService extends ChopperService {
  static AuthenticationService create([ChopperClient? client]) =>
      _$AuthenticationService(client);
  @Post(path: '/sign-up')
  Future<Response<String>> signUp(@Body() String body);
  @Post(path: '/sign-in')
  Future<Response<String>> signIn(@Body() String body);
}
