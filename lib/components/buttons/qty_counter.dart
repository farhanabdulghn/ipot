import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

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
        spacing: 4,
        children: [
          _CounterButton(
            icon: PhosphorIconsBold.minus,
            onTap: () {
              if (value <= 1) {
                onMinReached?.call();
                return;
              }
              onChanged(value - 1);
            },
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
          _CounterButton(
            icon: PhosphorIconsBold.plus,
            onTap: () => onChanged(value + 1),
            filled: true,
          ),
        ],
      ),
    );
  }
}

class _CounterButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final bool filled;

  const _CounterButton({
    required this.icon,
    required this.onTap,
    this.filled = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 150),
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: filled ? Colors.black87 : Colors.white,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Icon(
          icon,
          size: 13,
          color: filled ? Colors.white : Colors.black87,
        ),
      ),
    );
  }
}
