// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_learn/features/auth/presentation/widget/tcpp_widget.dart';
import 'package:sign_learn/features/auth/presentation/widget/two_part_auth_page_widget.dart';

import '../../../../core/core.dart';
import '../../../../routes/router.dart';
import '../../domain/domain.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../common/commons.dart';
import '../../../../gen/fonts.gen.dart';

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
          SignNavigator.of(context).replace(const HomeRoute());
        }
      },
    );

    final tt = TextTheme.of(context);
    final _formKey = GlobalKey<FormState>();
    final emailController = useTextEditingController();
    final passwordCotroller = useTextEditingController();

    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () async {
        // debugPrint("User Profile ==> ${ref.watch(userNotiferProvider)}");
        // debugPrint("User Profile ==> ${ref.watch(authNotifierProvider)}");

        final user = ref.watch(authNotifierProvider).userId!;

        debugPrint(user.toString());
        // SignNavigator.of(context).push(SignQuizRoute());
      }),
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
                YBox(padding),
                Text(
                  "SignBridge",
                  style: tt.headlineLarge!
                      .copyWith(fontFamily: FontFamily.clashDisplay),
                ),
                YBox(.08.dyPercent),
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
                            style: tt.labelMedium!.copyWith(
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
                        style: tt.labelMedium!.copyWith(
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
                        style: tt.labelMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontFamily: FontFamily.satoshi,
                        ),
                      ),
                    ],
                  ),
                ),
                YBox(47.dy),
                TwoPartAuthPages(
                  firstPart: "Dont have an account? ",
                  secondPart: "Create Account",
                  onTap: () {
                    SignNavigator.of(context).replace(SignupRoute());
                  },
                ),
                YBox(padding * 2),
                TCPPWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//jo
