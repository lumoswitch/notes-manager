import 'package:flutter/cupertino.dart';
import 'package:notes_manager/utilities/dialogs/generic_dialog.dart';

Future<void> showPasswordResetSentDialog(BuildContext context) {
  return showGenericDialog(
    context: context,
    title: 'Password reset',
    content: 'We have sent you a password reset. Checnk your emails',
    optionsBuilder: () => {
      'OK': null,
    },
  );
}
