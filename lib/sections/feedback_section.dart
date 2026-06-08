import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ipot/l10n/app_localizations.dart';
import 'package:ipot/state/stores/page_handle/page_handle_notifier.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

class FeedbackSection extends ConsumerWidget {
  final String? title;
  final String? subtitle;
  final IconData icon;
  final String? buttonText;
  final VoidCallback? onTap;
  final bool _isError;

  const FeedbackSection.empty({
    super.key,
    this.title,
    this.subtitle,
    this.icon = PhosphorIconsRegular.tray,
  }) : buttonText = null,
       onTap = null,
       _isError = false;

  const FeedbackSection.error({
    super.key,
    this.title,
    this.subtitle,
    this.icon = PhosphorIconsRegular.warningCircle,
    this.buttonText,
    required this.onTap,
  }) : _isError = true;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final menuNavigationHeight = ref.watch(
      pageHandleProvider.select((s) => s.menuNavigationHeight),
    );

    final resolvedTitle =
        title ?? (_isError ? l10n.errorTitle : l10n.noMenuAvailable);
    final resolvedSubtitle =
        subtitle ?? (_isError ? l10n.errorSubtitle : l10n.noMenuSubtitle);
    final resolvedButtonText = buttonText ?? l10n.tryAgain;

    return Padding(
      padding: EdgeInsets.only(bottom: menuNavigationHeight),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 36),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 32, color: Colors.grey.shade500),
              ),
              SizedBox(height: 20),
              Text(
                resolvedTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 8),
              Text(
                resolvedSubtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey.shade500,
                  height: 1.6,
                ),
              ),
              if (_isError && onTap != null) ...[
                SizedBox(height: 28),
                OutlinedButton.icon(
                  key: const Key('retry_button'),
                  onPressed: onTap,
                  icon: Icon(PhosphorIconsRegular.arrowClockwise, size: 16),
                  label: Text(resolvedButtonText),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
