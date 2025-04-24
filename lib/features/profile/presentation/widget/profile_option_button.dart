import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sign_learn/gen/fonts.gen.dart';

import '../../../../core/core.dart';

class ProfileOptionButton extends StatelessWidget {
  const ProfileOptionButton({
    super.key,
    required this.onTap,
    required this.iconAsset,
    required this.label,
    required this.subLabel,
  });

  final VoidCallback onTap;
  final String label;
  final String subLabel;
  final String iconAsset;

  @override
  Widget build(BuildContext context) {
    final tt = TextTheme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            SvgPicture.asset(iconAsset),
            XBox(padding),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: tt.labelMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontFamily: FontFamily.satoshi,
                  ),
                ),
                Text(
                  subLabel,
                  style: tt.labelSmall!.copyWith(
                    fontFamily: FontFamily.satoshi,
                    fontWeight: FontWeight.normal,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
