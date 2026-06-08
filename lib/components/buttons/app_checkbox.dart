import 'package:flutter/material.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

class AppCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final bool isRadio;

  const AppCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.isRadio = false,
  });

  @override
  Widget build(BuildContext context) {
    final disabled = onChanged == null;
    final radius = isRadio ? 100.0 : 6.0;

    return GestureDetector(
      onTap: disabled ? null : () => onChanged!(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeInOut,
        width: 22,
        height: 22,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: disabled
              ? Colors.grey.shade100
              : value
              ? Colors.black87
              : Colors.white,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(
            color: disabled
                ? Colors.grey.shade200
                : value
                ? Colors.black87
                : Colors.grey.shade300,
            width: 1.5,
          ),
        ),
        child: AnimatedScale(
          scale: value ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOutBack,
          child: PhosphorIcon(
            isRadio ? PhosphorIconsFill.circle : PhosphorIconsBold.check,
            color: Colors.white,
            size: isRadio ? 10 : 13,
          ),
        ),
      ),
    );
  }
}
