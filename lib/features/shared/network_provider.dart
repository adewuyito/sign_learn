import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:riverpod/riverpod.dart';

/// Correct: Exposes a stream of `ConnectivityResult`
final networkStatusProvider = StreamProvider<ConnectivityResult>((ref) {
  // TODO: Fix this imlementation
  return Connectivity().onConnectivityChanged.where((event) => event.);
});


Future<bool> isOnline() async {
  final connectivityResult = await Connectivity().checkConnectivity();
  return connectivityResult != ConnectivityResult.none;
}
