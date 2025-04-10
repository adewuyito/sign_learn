import 'package:flutter/material.dart';
import 'package:sign_learn/core/core.dart';

class SignButton extends StatelessWidget {
  const SignButton({
    super.key,
    this.onCall,
    required this.label,
  });

  final VoidCallback? onCall;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.dyPercent,
      height: 44.dy,
      child: ElevatedButton(
        onPressed: onCall,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: .5,
              color: appColors.dividerGrey,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(label),
      ),
    );
  }
}

class InputWidget extends StatelessWidget {
  const InputWidget({
    super.key,
    this.hintText = "",
    this.isFormField = false,
    required this.controller,
  });

  final String hintText;
  final bool isFormField;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    // TODO: Refactor for secure field
    return isFormField
        ? TextField(
            decoration: InputDecoration(hintText: hintText),
            controller: controller,
          )
        : TextFormField(
            decoration: InputDecoration(hintText: hintText),
            controller: controller,
          );
  }
}
