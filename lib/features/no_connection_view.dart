import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_learn/features/shared/network_provider.dart';

@RoutePage()
class NoConnectionView extends ConsumerStatefulWidget {
  const NoConnectionView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NoConnectionViewState();
}

class _NoConnectionViewState extends ConsumerState<NoConnectionView> {
  @override
  Widget build(BuildContext context) {
    ref.listen(isConnectedProvider, (previous, next) {
      next.whenData((isConnected) {
        if (isConnected && mounted) {
          context.router.pop(true);
        }
      });
    });

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.wifi_off_rounded,
                size: 64,
                color: Colors.grey,
              ),
              const SizedBox(height: 24),
              Text(
                "No Internet Connection",
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                "Please check your internet connection and try again",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.grey,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: () {
                  // Force a refresh of the connection status
                  ref.invalidate(isConnectedProvider);
                },
                icon: const Icon(Icons.refresh),
                label: const Text("Retry"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
