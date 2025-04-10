import 'routes/router.dart';
import 'core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'common/commons.dart';

class SignLearnApp extends StatefulHookConsumerWidget {
  const SignLearnApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignLearnAppState();
}

class _SignLearnAppState extends ConsumerState<SignLearnApp> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    Dims.setSize(media);
    return MaterialApp(
      theme: signLearnTheme,
      debugShowCheckedModeBanner: false,
      home: MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaler: const TextScaler.linear(1),
        ),
        child: Consumer(
          builder: (context, ref, child) {
            final router = ref.watch(signRouteProvider);
            ref.listen(
              isLoadingProvider,
              (_, isLoading) {
                isLoading
                    ? LoadingScreen.instance().show(context: context)
                    : LoadingScreen.instance().hide();
              },
            );
            return Router(
              routerDelegate: AutoRouterDelegate(
                router,
                navigatorObservers: () => [SignNavigatorObserver()],
              ),
              routeInformationParser: router.defaultRouteParser(),
              routeInformationProvider: router.routeInfoProvider(),
              backButtonDispatcher: RootBackButtonDispatcher(),
            );
          },
        ),
      ),
    );
  }
}


/* 

  Widget build(BuildContext context) {
    final router = ref.watch(signRouteProvider);
    final media = MediaQuery.of(context);
    Dims.setSize(media);

    return MaterialApp.router(
      routerDelegate: AutoRouterDelegate(
        router,
        navigatorObservers: () => [SignNavigatorObserver()],
      ),
      routeInformationParser: router.defaultRouteParser(),
      routeInformationProvider: router.routeInfoProvider(),
      backButtonDispatcher: RootBackButtonDispatcher(),
      debugShowCheckedModeBanner: false,
      theme: signLearnTheme,
    );
  }
 */


/* 

return MaterialApp(
      theme: signLearnTheme,
      debugShowCheckedModeBanner: false,
      // localizationsDelegates: AppLocalizations.localizationsDelegates,
      // supportedLocales: AppLocalizations.supportedLocales,
      home: Builder(
        builder: (context) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: const TextScaler.linear(1),
            ),
            child: Router(
              routerDelegate: AutoRouterDelegate(
                router,
                navigatorObservers: () => [SignNavigatorObserver()],
              ),
              routeInformationParser: router.defaultRouteParser(),
              routeInformationProvider: router.routeInfoProvider(),
              backButtonDispatcher: RootBackButtonDispatcher(),
            ),
          );
        },
      ),
    );

 */