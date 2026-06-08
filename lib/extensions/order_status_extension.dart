part of 'extensions.dart';

extension OrderStatusExtension on OrderStatus {
  ComponentPropsModel get toProps {
    switch (this) {
      case OrderStatus.pending:
        return ComponentPropsModel(
          title: (l) => l.orderStatusPendingTitle,
          subtitle: (l) => l.orderStatusPendingSubtitle,
          duotoneIcon: PhosphorIconsDuotone.spinnerGap,
          color: Colors.orange,
        );
      case OrderStatus.confirmed:
        return ComponentPropsModel(
          title: (l) => l.orderStatusConfirmedTitle,
          subtitle: (l) => l.orderStatusConfirmedSubtitle,
          duotoneIcon: PhosphorIconsDuotone.checkCircle,
          color: Colors.indigo,
        );
      case OrderStatus.preparing:
        return ComponentPropsModel(
          title: (l) => l.orderStatusPreparingTitle,
          subtitle: (l) => l.orderStatusPreparingSubtitle,
          duotoneIcon: PhosphorIconsDuotone.forkKnife,
          color: Colors.deepPurple,
        );
      case OrderStatus.ready:
        return ComponentPropsModel(
          title: (l) => l.orderStatusReadyTitle,
          subtitle: (l) => l.orderStatusReadySubtitle,
          duotoneIcon: PhosphorIconsDuotone.package,
          color: Colors.green,
        );
      case OrderStatus.served:
        return ComponentPropsModel(
          title: (l) => l.orderStatusServedTitle,
          subtitle: (l) => l.orderStatusServedSubtitle,
          duotoneIcon: PhosphorIconsDuotone.smiley,
          color: Colors.teal,
        );
    }
  }
}
