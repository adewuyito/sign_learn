import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/commons.dart';
import '../../../../core/core.dart';
import '../../../../gen/fonts.gen.dart';
import '../../../../routes/router.dart';
import '../../auth.dart';

@RoutePage()
class SignupView extends StatefulHookConsumerWidget {
  const SignupView({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignupViewState();
}

class _SignupViewState extends ConsumerState<SignupView> {
  @override
  Widget build(BuildContext context) {
    final tt = TextTheme.of(context);
    final _formKey = GlobalKey<FormState>();
    final emailController = useTextEditingController();
    final passwordCotroller = useTextEditingController();
    final repasswordCotroller = useTextEditingController();
    final nameCotroller = useTextEditingController();

    return Scaffold(
      body: SafeArea(
        minimum: safeAreaPadding,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    width: .7.dxPercent,
                    child: SignUpHeadlineText(tt: tt),
                  ),
                ),
                YBox((padding * 2).dy),
                SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: Column(
                    spacing: 45.dy,
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
                ),
                YBox(70.dy),
                SignUpButton(
                  label: "Sign Up",
                  color: appColors.buttonYellow,
                  onPressed: () => ref
                      .read(authNotifierProvider.notifier)
                      .signUpWithCredentials(
                        name: nameCotroller.text,
                        email: emailController.text,
                        password: passwordCotroller.text,
                        context: context,
                      ),
                ),
                YBox(24.dy),
                TwoPartAuthPages(
                  firstPart: "Already have an account? ",
                  secondPart: "Log in",
                  onTap: () {
                    SignNavigator.of(context).replace(LoginRoute());
                  },
                ),
                YBox(24.dy),
                TCPPWidget(),
                // TODO: Add SignUp With Google and SignIn With AppleId button
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignUpHeadlineText extends StatelessWidget {
  const SignUpHeadlineText({
    super.key,
    required this.tt,
  });

  final TextTheme tt;

  @override
  Widget build(BuildContext context) {
    return RichTextWidget(
      styleForAll: tt.headlineMedium!.copyWith(
        fontFamily: FontFamily.clashDisplay,
        fontWeight: FontWeight.normal,
      ),
      texts: [
        BaseText.plain(text: "Let's start by creating your "),
        BaseText.plain(
          text: 'account.',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
