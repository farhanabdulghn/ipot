part of 'extensions.dart';

extension OrderStatusExtension on OrderStatus {
  ComponentPropsModel get toProps {
    switch (this) {
      case OrderStatus.pending:
        return ComponentPropsModel(
          title: (l) => l.orderStatusPendingTitle,
          subtitle: (l) => l.orderStatusPendingSubtitle,
          icon: PhosphorIcons.spinnerGap,
          color: Colors.orange,
        );
      case OrderStatus.confirmed:
        return ComponentPropsModel(
          title: (l) => l.orderStatusConfirmedTitle,
          subtitle: (l) => l.orderStatusConfirmedSubtitle,
          icon: PhosphorIcons.checkCircle,
          color: Colors.indigo,
        );
      case OrderStatus.preparing:
        return ComponentPropsModel(
          title: (l) => l.orderStatusPreparingTitle,
          subtitle: (l) => l.orderStatusPreparingSubtitle,
          icon: PhosphorIcons.forkKnife,
          color: Colors.deepPurple,
        );
      case OrderStatus.ready:
        return ComponentPropsModel(
          title: (l) => l.orderStatusReadyTitle,
          subtitle: (l) => l.orderStatusReadySubtitle,
          icon: PhosphorIcons.package,
          color: Colors.green,
        );
      case OrderStatus.served:
        return ComponentPropsModel(
          title: (l) => l.orderStatusServedTitle,
          subtitle: (l) => l.orderStatusServedSubtitle,
          icon: PhosphorIcons.smiley,
          color: Colors.teal,
        );
    }
  }
}
