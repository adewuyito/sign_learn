import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class SignQuizView extends ConsumerStatefulWidget {
  const SignQuizView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignQuizeViewState();
}

class _SignQuizeViewState extends ConsumerState<SignQuizView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(''),
      ),
    );
  }
}
