part of 'extensions.dart';

extension OrderStatusExtension on OrderStatus {
  ComponentPropsModel toProps(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    switch (this) {
      case OrderStatus.pending:
        return ComponentPropsModel(
          subtitle: l10n.orderStatusPendingSubtitle,
          duotone: PhosphorIconsDuotone.spinnerGap,
          color: Colors.orange,
        );
      case OrderStatus.confirmed:
        return ComponentPropsModel(
          subtitle: l10n.orderStatusConfirmedSubtitle,
          duotone: PhosphorIconsDuotone.checkCircle,
          color: Colors.indigo,
        );
      case OrderStatus.preparing:
        return ComponentPropsModel(
          subtitle: l10n.orderStatusPreparingSubtitle,
          duotone: PhosphorIconsDuotone.forkKnife,
          color: Colors.deepPurple,
        );
      case OrderStatus.ready:
        return ComponentPropsModel(
          subtitle: l10n.orderStatusReadySubtitle,
          duotone: PhosphorIconsDuotone.package,
          color: Colors.green,
        );
      case OrderStatus.served:
        return ComponentPropsModel(
          subtitle: l10n.orderStatusServedSubtitle,
          duotone: PhosphorIconsDuotone.smiley,
          color: Colors.teal,
        );
    }
  }
}
