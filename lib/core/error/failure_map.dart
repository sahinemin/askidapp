import 'package:askidapp/core/constants/constants.dart';
import 'package:askidapp/core/error/failure.dart';

class FailureMap {
  String mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ClientFailure:
        return AppConstants.clientFailureMessage;
      case ServerFailure:
        return AppConstants.serverFailureMessage;
      case NetworkFailure:
        return AppConstants.networkFailureMessage;
      default:
        return AppConstants.unexpectedErrorMessage;
    }
  }
}
