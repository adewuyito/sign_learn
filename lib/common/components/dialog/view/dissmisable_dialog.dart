import 'package:flutter/material.dart';
import '../model/alert_dialog.dart';

@immutable
class NextMouleDialog extends AlertDialogModel<bool> {
  const NextMouleDialog() : super(
          title: '',
          buttons: const {
            'Take Quiz': true,
          },
          message: 'This ASL module can not be accessed at the time, complete the previous module',
        );
}
