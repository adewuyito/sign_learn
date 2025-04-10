import 'package:flutter/material.dart';

import '../model/alert_dialog.dart';

@immutable
class SaveDialog extends AlertDialogModel<bool> {
  SaveDialog()
      : super(
          title: 'Save changes',
          buttons: {
            'Cancel': false,
            'Yes': true,
          },
          message: 'Are you sure you want to this changes',
        );
}
