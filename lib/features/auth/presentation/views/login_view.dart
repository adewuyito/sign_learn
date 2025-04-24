// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/core.dart';
import '../../domain/domain.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../routes/sign_navigator.dart';

import '../../../../common/commons.dart';
import '../../../../gen/fonts.gen.dart';
import '../../domain/providers/is_logged_provider.dart';

@RoutePage()
class LoginView extends StatefulHookConsumerWidget {
  const LoginView({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  @override
  Widget build(BuildContext context) {
    ref.listen<bool>(
      isLoggedInProvider,
      (prev, next) {
        if (next && ref.read(authNotifierProvider).userId != null) {
          SignNavigator.of(context).pop<bool>(next);
        }
      },
    );
    final _formKey = GlobalKey<FormState>();
    final emailController = useTextEditingController();
    final passwordCotroller = useTextEditingController();

    return Scaffold(
      body: SafeArea(
        bottom: false,
        minimum: safeAreaPadding,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(0),
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InputModel(
                  keyBoardType: TextInputType.emailAddress,
                  role: TextFieldRole.inputField,
                  controller: emailController,
                  label: "Email",
                ),
                YBox(20),
                InputModel(
                  role: TextFieldRole.secureField,
                  controller: passwordCotroller,
                  label: "Password",
                ),
                YBox(50.dy),
                // TODO: Add SignIn With Google and SignIn With AppleId button

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SignActionButton(
                      color: appColors.purple,
                      label: "Login",
                      onPressed: () => ref
                          .read(authNotifierProvider.notifier)
                          .loginWithCredentials(
                            email: emailController.text,
                            password: passwordCotroller.text,
                            context: context,
                          ),
                    ),
                    SignActionButton(
                      color: appColors.black,
                      labelWidget: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 12,
                        children: [
                          SvgPicture.asset(
                            Assets.icons.miscIcons.revealIcon,
                            colorFilter: ColorFilter.srgbToLinearGamma(),
                          ),
                          Text(
                            'Face Id',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                  fontFamily: FontFamily.satoshi,
                                  fontWeight: FontWeight.w500,
                                  color: appColors.white,
                                ),
                          ),
                        ],
                      ),
                      onPressed: () => ref
                          .read(authNotifierProvider.notifier)
                          .loginWithCredentials(
                            email: emailController.text,
                            password: passwordCotroller.text,
                            context: context,
                          ),
                    ),
                  ],
                ),
                YBox(138.dy),
                SignActionButton(
                  onPressed: () {},
                  size: buttonSize(ButtonSize.full),
                  color: appColors.paleOrange,
                  labelWidget: Row(
                    spacing: 23,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(Assets.icons.socialIcons.googlePlain),
                      Text(
                        'Continue with Google',
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: FontFamily.satoshi,
                                ),
                      ),
                    ],
                  ),
                ),
                YBox(36.dy),
                SignActionButton(
                  onPressed: () {},
                  size: buttonSize(ButtonSize.full),
                  color: appColors.paleGreen,
                  labelWidget: Row(
                    spacing: 23,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(Assets.icons.socialIcons.facebookPlain),
                      Text(
                        'Continue with Facebook',
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: FontFamily.satoshi,
                                ),
                      ),
                    ],
                  ),
                ),
                RichTextWidget(texts: [
                  BaseText.plain(text: "Dont have an account?", style: TextTheme.of(context).labelSmall),
                  BaseText.plain(text: "Create Account")
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
