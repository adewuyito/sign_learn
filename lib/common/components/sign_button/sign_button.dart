import 'package:flutter/material.dart';
import 'package:sign_learn/common/enums.dart';
import 'package:sign_learn/gen/fonts.gen.dart';

import '../../../core/core.dart';
import '../dialog/model/alert_dialog.dart';
import '../box_outline.dart';

class SignUpButton extends StatelessWidget {
  final Color color;
  final String label;
  late final Size _size;
  final VoidCallback? onPressed;
  final ButtonRole role;

  SignUpButton({
    super.key,
    Size? size,
    this.color = Colors.blueAccent,
    required this.label,
    required this.onPressed,
    this.role = ButtonRole.normal,
  }) {
    size == null ? _size = Size(398.dx, 44.dy) : _size = size;
  }

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
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
              ? {dialogResult == true ? onPressed : null}
              : null;
        }, // ? Fix to work as intended
      ButtonRole.normal => onPressed,
    };

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned.directional(
          textDirection: TextDirection.ltr,
          start: 3,
          top: 4,
          child: Container(
            width: _size.width,
            height: _size.height,
            decoration: BoxDecoration(
              color: appColors.white,
              border: Border.all(color: Colors.black, width: 2),
              borderRadius: BorderRadius.all(Radius.elliptical(90, 90)),
            ),
          ),
        ),
        SizedBox.fromSize(
          size: Size.copy(_size),
          child: FilledButton(
            style: FilledButton.styleFrom(
              // fixedSize: Size(_size.width, _size.height),
              maximumSize: Size.copy(_size),
              backgroundColor: role == ButtonRole.destructive
                  ? ButtonRole.destructive.activeColor
                  : color,
              disabledBackgroundColor: role == ButtonRole.destructive
                  ? ButtonRole.destructive.deActiveColor
                  : color.withAlpha(100),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.elliptical(90, 90)),
                side: BorderSide(
                  color: appColors.black,
                  width: 2,
                ),
              ),
            ),
            onPressed: ranCommand,
            child: Text(
              label,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontFamily: FontFamily.satoshi,
                    fontWeight: FontWeight.bold,
                    color: appColors.black,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}

class SignActionButton extends StatelessWidget {
  final Color color;
  final String? label;
  final Widget? labelWidget;
  late final Size _size;
  final VoidCallback? onPressed;
  final ButtonRole role;

  SignActionButton({
    super.key,
    Size? size,
    this.color = Colors.blueAccent,
    this.label,
    this.labelWidget,
    required this.onPressed,
    this.role = ButtonRole.normal,
  }) {
    size == null ? _size = Size(166.dx, 62.dy) : _size = size;
  }

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
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
              ? {dialogResult == true ? onPressed : null}
              : null;
        }, // ? Fix to work as intended
      ButtonRole.normal => onPressed,
    };

    return BoxOutline(
      size: _size,
      child: FilledButton(
        style: FilledButton.styleFrom(
          // fixedSize: Size(_size.width, _size.height),
          maximumSize: Size.copy(_size),
          backgroundColor: role == ButtonRole.destructive
              ? ButtonRole.destructive.activeColor
              : color,
          disabledBackgroundColor: role == ButtonRole.destructive
              ? ButtonRole.destructive.deActiveColor
              : color.withAlpha(100),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color: appColors.black,
              width: 2,
            ),
          ),
        ),
        onPressed: ranCommand,
        child: labelWidget ??
            Text(
              label ?? "",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    fontFamily: FontFamily.satoshi,
                    fontWeight: FontWeight.w500,
                    color: appColors.black,
                  ),
            ),
      ),
    );
  }
}
