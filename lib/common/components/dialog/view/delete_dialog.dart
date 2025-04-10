import 'package:flutter/material.dart';
import '../model/alert_dialog.dart';

@immutable
class DeleteDialog extends AlertDialogModel<bool> {
  const DeleteDialog({
    required String titleOfObjectToDelete,
  }) : super(
          title: 'Delete $titleOfObjectToDelete?',
          buttons: const {
            'Cancel': false,
            'Delete': true,
          },
          message: 'Are you sure you want to delete this?',
        );
}
