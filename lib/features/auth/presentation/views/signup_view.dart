import 'package:flutter/material.dart';
import 'package:sign_learn/core/core.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_learn/features/auth/auth.dart';

import '../../../../common/commons.dart';
// import '../auth_widgets.dart';

@RoutePage()
class SignupView extends StatefulHookConsumerWidget {
  const SignupView({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignupViewState();
}

class _SignupViewState extends ConsumerState<SignupView> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final emailController = useTextEditingController();
    final passwordCotroller = useTextEditingController();
    final repasswordCotroller = useTextEditingController();
    final nameCotroller = useTextEditingController();

    return Scaffold(
      body: SafeArea(
        minimum: safeAreaPadding,
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                YBox(.25.dyPercent),
                Column(
                  spacing: 12.dy,
                  children: [
                    InputModel(
                      // isFormField: true,
                      label: 'Name',
                      controller: nameCotroller,
                    ),
                    InputModel(
                      // isFormField: true,
                      role: TextFieldRole.validationField,
                      label: 'Email',
                      controller: emailController,
                    ),
                    InputModel(
                      role: TextFieldRole.secureField,
                      // isFormField: true,
                      label: 'Password',
                      controller: passwordCotroller,
                    ),
                    InputModel(
                      role: TextFieldRole.secureField,
                      // isFormField: true,
                      label: 'Retype Password',
                      controller: repasswordCotroller,
                    ),
                  ],
                ),
                YBox(.1.dyPercent),
                SignUpButton(
                  label: "Sign Up",
                  color: appColors.buttonYellow,
                  onPressed: () => ref
                      .read(authStateProvider.notifier)
                      .signUpWithCredentials(
                        name: nameCotroller.text,
                        email: emailController.text,
                        password: passwordCotroller.text,
                        context: context,
                      ),
                ),

                // TODO: Add SignUp With Google and SignIn With AppleId button
              ],
            ),
          ),
        ),
      ),
    );
  }
}
