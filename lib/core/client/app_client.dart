import 'package:askidapp/core/constants/constants.dart';
import 'package:askidapp/features/authentication/data/service/authentication_service.dart';
import 'package:chopper/chopper.dart';

class AppClient extends ChopperClient {
  AppClient()
      : super(
          baseUrl: Uri.parse(AppConstants.baseUrl),
          services: [
            AuthenticationService.create(),
          ],
          interceptors: [
            const HeadersInterceptor(
              {'Content-Type': 'application/json'},
            )
          ],
        );
}
