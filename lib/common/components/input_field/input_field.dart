import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sign_learn/common/commons.dart';
import 'package:sign_learn/gen/assets.gen.dart';

import '../../../core/core.dart';
import '../../enums.dart';

class InputModel extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final TextFieldRole role;
  final TextInputType? keyBoardType;

  const InputModel({
    super.key,
    required this.controller,
    required this.label,
    this.keyBoardType,
    this.role = TextFieldRole.inputField,
  });

  @override
  State<InputModel> createState() => _InputModelState();
}

class _InputModelState extends State<InputModel> {
  bool _obscureText = true;

  void _toggleObscurity() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final _focusNode = FocusNode();
    final _size = Size(398.dx, 62.dy);

    return switch (widget.role) {
      TextFieldRole.inputField => Stack(
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
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            Container(
              width: _size.width,
              height: _size.height,
              decoration: BoxDecoration(
                color: appColors.white,
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                keyboardType: widget.keyBoardType,
                focusNode: _focusNode,
                onTapOutside: (event) => _focusNode.unfocus(),
                decoration: InputDecoration(
                  hintText: widget.label,
                ),
                controller: widget.controller,
                expands: true,
                maxLength: null,
                maxLines: null,
              ),
            ),
          ],
        ),
      TextFieldRole.secureField => Stack(
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
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            Container(
              width: _size.width,
              height: _size.height,
              decoration: BoxDecoration(
                color: appColors.white,
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                keyboardType:
                    _obscureText ? null : TextInputType.visiblePassword,
                focusNode: _focusNode,
                onTapOutside: (event) => _focusNode.unfocus(),
                obscureText: _obscureText,
                autocorrect: false,
                decoration: InputDecoration(
                  hintText: widget.label,
                  suffixIcon: IconButton(
                    splashColor: appColors.transparent,
                    onPressed: _toggleObscurity,
                    icon: _obscureText
                        ? SvgPicture.asset(Assets.icons.miscIcons.revealIcon)
                        : SvgPicture.asset(Assets.icons.miscIcons.unRevealIcon),
                  ),
                ),
                controller: widget.controller,
                // expands: true,
                // maxLength: null,
                // maxLines: null,
              ),
            ),
          ],
        ),
      TextFieldRole.validationField => Stack(
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
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            Container(
              width: _size.width,
              height: _size.height,
              decoration: BoxDecoration(
                color: appColors.white,
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                keyboardType: widget.keyBoardType,
                autocorrect: false,
                focusNode: _focusNode,
                onTapOutside: (event) => _focusNode.unfocus(),
                decoration: InputDecoration(
                  hintText: widget.label,
                  /*  suffixIcon: Padding(
                padding: const EdgeInsetsDirectional.only(end: 24),
                child: Icon(Icons.remove_red_eye), // ? fix with the role
              ), */
                ),
                controller: widget.controller,
                expands: true,
                maxLength: null,
                maxLines: null,
              ),
            ),
          ],
        ),
    };
  }
}
