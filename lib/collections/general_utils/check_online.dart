import 'dart:io';
import 'dart:async';

import 'package:connectivity/connectivity.dart';

class ConnectionStatus {
  static final ConnectionStatus _singleton = new ConnectionStatus._internal();

  ConnectionStatus._internal();

  static ConnectionStatus getInstance() => _singleton;

  bool hasConnection = false;

  StreamController connectionChangeController =
      new StreamController.broadcast();

  final Connectivity _connectivity = Connectivity();

  void initialize() {
    _connectivity.onConnectivityChanged.listen(_connectionChange);
    checkConnection();
  }

  Stream get connectionChange => connectionChangeController.stream;

  void dispose() {
    connectionChangeController.close();
  }

  void _connectionChange(ConnectivityResult result) {
    checkConnection();
  }

  Future<bool> checkConnection() async {
    bool previousConnection = hasConnection;

    try {
      final result =
          await InternetAddress.lookup('example.com'); //''''google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        hasConnection = true;
      } else {
        hasConnection = false;
      }
    } on SocketException catch (_) {
      hasConnection = false;
    }

    if (previousConnection != hasConnection) {
      connectionChangeController.add(hasConnection);
    }

    return hasConnection;
  }
}

Future<bool> isOnlineCheck() async {
  ConnectionStatus connectionStatus = ConnectionStatus.getInstance();
  bool isOnline = await connectionStatus.checkConnection();
  return isOnline;
}
