import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class INetworkInfo {
  Future<bool> isConnected();
}

class NetworkInfo  extends INetworkInfo {
  @override
  Future<bool> isConnected() => InternetConnectionChecker().hasConnection;
}
