import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfo {
  Future<bool> isConnected();
}

class NetworkInfoImpl implements NetworkInfo {
  ConnectivityResult? connectivityResult;

  NetworkInfoImpl(this.connectivityResult);

  @override
  Future<bool> isConnected() async {
    connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult == null ? false : true;
  }
}
