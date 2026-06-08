import 'package:flutter/material.dart';
import 'package:ipot/components/buttons/app_icon_button.dart';
import 'package:ipot/utils/enums.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

class QtyCounter extends StatelessWidget {
  final int value;
  final ValueChanged<int> onChanged;
  final VoidCallback? onMinReached;

  const QtyCounter({
    super.key,
    required this.value,
    required this.onChanged,
    this.onMinReached,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(100),
      ),
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 8,
        children: [
          AppIconButton(
            onTap: () {
              if (value <= 1) {
                onMinReached?.call();
                return;
              }
              onChanged(value - 1);
            },
            icon: PhosphorIconsBold.minus,
            size: SizeVariant.small,
          ),
          AnimatedSwitcher(
            duration: Duration(milliseconds: 180),
            transitionBuilder: (child, animation) => ScaleTransition(
              scale: animation,
              child: FadeTransition(opacity: animation, child: child),
            ),
            child: Text(
              '$value',
              key: ValueKey(value),
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
          ),
          AppIconButton(
            onTap: () => onChanged(value + 1),
            icon: PhosphorIconsBold.plus,
            size: SizeVariant.small,
            type: TypeVariant.black,
          ),
        ],
      ),
    );
  }
}
