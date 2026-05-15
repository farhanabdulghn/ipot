import 'package:flutter/material.dart';
import 'package:ipot/l10n/app_localizations.dart';

class DialogQuestionSection extends StatelessWidget {
  final String content;
  final String? cancelTitle;
  final String confirmTitle;
  const DialogQuestionSection({
    super.key,
    required this.content,
    this.cancelTitle,
    required this.confirmTitle,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final labelLarge = Theme.of(context).textTheme.labelLarge;

    return AlertDialog.adaptive(
      title: Text(confirmTitle),
      content: Text(content),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(textStyle: labelLarge),
          child: Text(cancelTitle ?? l10n.cancel),
          onPressed: () => Navigator.pop(context),
        ),
        TextButton(
          style: TextButton.styleFrom(textStyle: labelLarge),
          child: Text(confirmTitle),
          onPressed: () => Navigator.pop(context, true),
        ),
      ],
    );
  }
}
