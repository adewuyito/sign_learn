import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sign_learn/gen/fonts.gen.dart';

import '../../../../common/commons.dart';
import '../../../../core/core.dart';

class ProfileOptionButton extends StatelessWidget {
  const ProfileOptionButton({
    super.key,
    required this.onTap,
    required this.iconAsset,
    required this.label,
    required this.subLabel,
    this.role = ButtonRole.normal,
  });

  final VoidCallback onTap;
  final String label;
  final String subLabel;
  final String iconAsset;
  final ButtonRole role;

  @override
  Widget build(BuildContext context) {
    final tt = TextTheme.of(context);
        Future<bool?> _show() async {
      return AlertDialogModel(
        title: '',
        message: 'Are you sure',
        buttons: {
          'Yes': true,
          'No': false,
        },
      ).present(context);
    }

    final VoidCallback? ranCommand;

    ranCommand = switch (role) {
      ButtonRole.destructive => () async {
          final dialogResult = await _show();
          // HapticUtils.mediumImpact();
          dialogResult != null
              ? {dialogResult == true ? onTap.call() : null}
              : null;
        }, // ? Fix to work as intended
      ButtonRole.normal => onTap,
    };

    return GestureDetector(
      onTap: ranCommand,
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
