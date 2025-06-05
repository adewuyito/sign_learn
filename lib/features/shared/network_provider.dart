import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:riverpod/riverpod.dart';

abstract class NetworkInfo {
  Stream<bool> get connectionStream;
}

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectivity;

  NetworkInfoImpl(this.connectivity);

  @override
  Stream<bool> get connectionStream => connectivity.onConnectivityChanged
      .map((result) => !result.contains(ConnectivityResult.none));
}

final connectivityProvider = Provider<Connectivity>((ref) {
  return Connectivity();
});

final networkInfoProvider = Provider<NetworkInfo>((ref) {
  return NetworkInfoImpl(ref.watch(connectivityProvider));
});

final isConnectedProvider = StreamProvider<bool>((ref) {
  return ref.watch(networkInfoProvider).connectionStream;
});
