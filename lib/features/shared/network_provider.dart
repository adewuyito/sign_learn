import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:riverpod/riverpod.dart';

abstract class NetworkInfo {
  Future<bool>? get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final DataConnectionChecker connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}

final isConnectedNetworkInfoProvider = FutureProvider<bool>((ref) async {
  return await NetworkInfoImpl(DataConnectionChecker()).isConnected;
});
