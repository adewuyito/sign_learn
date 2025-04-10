import 'package:flutter/material.dart';

import '../../../core/core.dart'
    show appColors, DimsExtension;

import '../../../gen/fonts.gen.dart';

class GradientButtonWidget extends StatelessWidget {
  final VoidCallback? onClick;
  final String buttonText;
  const GradientButtonWidget({
    required this.buttonText,
    required this.onClick,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: ElevatedButton(
        onPressed: onClick,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          elevation: 0,
          maximumSize: Size.fromHeight(55.dy),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
        ),
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: onClick != null
                  ? appColors.appGradient.values.toList()
                  : [...appColors.appGradient.values.toList().map((e) => e.withAlpha(51))],
            ),
            borderRadius: BorderRadius.circular(32),
          ),
          width: 354,
          child: Container(
            constraints: BoxConstraints.expand(
              height: 55.dy,
            ),
            alignment: Alignment.center,
            child: Text(
              buttonText,
              style: TextStyle(
                color: appColors.white,
                fontFamily: FontFamily.generalSans,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
