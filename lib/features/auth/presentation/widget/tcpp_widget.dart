import 'package:flutter/material.dart';
import 'package:sign_learn/common/commons.dart';
import 'package:sign_learn/core/core.dart';
import 'package:sign_learn/gen/fonts.gen.dart';

class TCPPWidget extends StatelessWidget {
  const TCPPWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichTextWidget(
      textAlign: TextAlign.center,
      styleForAll: TextStyle(
        color: appColors.black,
        fontFamily: FontFamily.satoshi,
        fontSize: 15.sp,
        fontWeight: FontWeight.w500,
      ),
      texts: [
        BaseText.plain(
          text: "By Continiuning, you accept our ",
        ),
        BaseText.link(
          text: "Terms and Conditions, ",
          style: TextStyle(
              color: appColors.black,
              decoration: TextDecoration.underline),
          onTapped: () {}, //TODO: Set pages
        ),
        BaseText.link(
          text: "Privacy Policy.",
          style: TextStyle(
              color: appColors.black,
              decoration: TextDecoration.underline),
          onTapped: () {},
        ),
      ],
    );
  }
}
