import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sign_learn/common/commons.dart';
import 'package:sign_learn/gen/assets.gen.dart';
import 'package:sign_learn/gen/fonts.gen.dart';

import '../../../core/core.dart';
import '../../enums.dart';
// ! TODO: Unfinished Work
class InputModel extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final TextFieldRole role;
  final TextInputType? keyBoardType;
  final bool withFloatingLabel;
  final FormFieldValidator<String>? validator;

  const InputModel({
    super.key,
    required this.controller,
    required this.label,
    this.keyBoardType,
    this.withFloatingLabel = false,
    this.role = TextFieldRole.inputField,
    this.validator,
  });

  @override
  State<InputModel> createState() => _InputModelState();
}

class _InputModelState extends State<InputModel> {
  late TextEditingController _controller;
  final _focusNode = FocusNode();
  bool _obscureText = true;
  bool _hasError = false;
  String? _errorText;

  void _toggleObscurity() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onFocusChange() {
    if (!_focusNode.hasFocus && _controller.text.isNotEmpty) {
      _validateEmail();
    }
  }

  void _validateEmail() {
    final error = (widget.validator ??
        InputValidatorUtils.validEmailAddress)(_controller.text);
    setState(() {
      _hasError = error != null;
      _errorText = error;
    });
  }

  @override
  Widget build(BuildContext context) {
    final InputDecoration _decoration = InputDecoration(
      hintText: !widget.withFloatingLabel ? widget.label : null,
      label: widget.withFloatingLabel
          ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              decoration: BoxDecoration(color: appColors.white),
              child: Text(widget.label),
            )
          : null,
      labelStyle: TextTheme.of(context).labelMedium!.copyWith(
            fontFamily: FontFamily.satoshi,
          ),
      floatingLabelBehavior: FloatingLabelBehavior.always,
    );
    // ignore: no_leading_underscores_for_local_identifiers

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
                decoration: _decoration,
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
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                inputFormatters: [
                  FilteringTextInputFormatter.deny(RegExp(r'\s')),
                  LengthLimitingTextInputFormatter(254)
                ],
                keyboardType: widget.keyBoardType,
                autocorrect: false,
                focusNode: _focusNode,
                onTapOutside: (event) => _focusNode.unfocus(),
                decoration: _decoration.copyWith(),
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
