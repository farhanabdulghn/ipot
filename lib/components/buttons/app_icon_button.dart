import 'package:flutter/material.dart';
import 'package:ipot/utils/enums.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

class AppIconButton extends StatelessWidget {
  final void Function()? onTap;
  final IconData icon;
  final SizeVariant size;
  final TypeVariant type;
  const AppIconButton({
    super.key,
    required this.onTap,
    required this.icon,
    this.size = SizeVariant.medium,
    this.type = TypeVariant.white,
  });

  @override
  Widget build(BuildContext context) {
    final padding = switch (size) {
      SizeVariant.small => 6.0,
      SizeVariant.medium => 12.0,
    };

    final iconSize = switch (size) {
      SizeVariant.small => 16.0,
      SizeVariant.medium => 19.0,
    };

    final backgroundColor = switch (type) {
      TypeVariant.white => Colors.white,
      TypeVariant.black => Colors.black87,
      TypeVariant.transparent => Colors.white.withValues(alpha: 0.15),
    };

    final iconColor = switch (type) {
      TypeVariant.white => Colors.black87,
      TypeVariant.black => Colors.white,
      TypeVariant.transparent => Colors.white,
    };

    return IconButton(
      constraints: BoxConstraints(),
      padding: EdgeInsets.all(padding),
      style: ButtonStyle(
        backgroundColor: WidgetStateColor.resolveWith((state) {
          if (state.contains(WidgetState.disabled)) return Colors.white60;
          return backgroundColor;
        }),
        shape: WidgetStatePropertyAll(
          CircleBorder(
            side: BorderSide(
              color: type == TypeVariant.transparent
                  ? Colors.white.withValues(alpha: 0.2)
                  : backgroundColor,
            ),
          ),
        ),
      ),
      onPressed: onTap,
      icon: PhosphorIcon(icon, size: iconSize, color: iconColor),
    );
  }
}
