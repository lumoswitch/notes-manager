import 'package:flutter/material.dart';
import 'package:notes_manager/extensions/buildContext/loc.dart';
import 'package:notes_manager/utilities/dialogs/generic_dialog.dart';

Future<void> showCannotShareEmptyNoteDialog(BuildContext context) {
  return showGenericDialog<void>(
    context: context,
    title: context.loc.sharing,
    content: context.loc.cannot_share_empty_note_prompt,
    optionsBuilder: () => {
      'OK': null,
    },
  );
}