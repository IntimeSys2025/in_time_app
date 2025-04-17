import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

sealed class NetworkStatus {
  Future<bool> get isConnected;
}

class NetworkStatusImpl implements NetworkStatus {
  NetworkStatusImpl(this.internetConnection);
  final InternetConnection internetConnection;

  @override
  Future<bool> get isConnected async =>
      await internetConnection.hasInternetAccess;
}
