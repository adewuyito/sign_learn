import 'package:flutter/material.dart';
import 'package:sign_learn/common/commons.dart';
import 'package:sign_learn/core/core.dart';
import 'package:sign_learn/gen/fonts.gen.dart';

class TwoPartAuthPages extends StatelessWidget {
  final String firstPart;
  final String secondPart;
  final VoidCallback onTap;
  const TwoPartAuthPages({
    super.key,
    required this.firstPart,
    required this.secondPart,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return RichTextWidget(
        styleForAll: TextStyle(
            color: appColors.black,
            fontFamily: FontFamily.satoshi,
            fontSize: 15.sp,
            fontWeight: FontWeight.w500),
        texts: [
          BaseText.plain(
            text: firstPart,
          ),
          BaseText.link(
            text: secondPart,
            onTapped: onTap,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: appColors.buttonYellow,
            ),
          ),
        ]);
  }
}
