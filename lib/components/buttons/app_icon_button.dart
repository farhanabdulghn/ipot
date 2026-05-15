import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AppIconButton extends StatelessWidget {
  final void Function()? onTap;
  final IconData icon;
  const AppIconButton({super.key, this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      constraints: BoxConstraints(),
      padding: EdgeInsets.all(4),
      style: ButtonStyle(
        backgroundColor: WidgetStateColor.resolveWith((state) {
          if (state.contains(WidgetState.disabled)) return Colors.white60;
          return Colors.white;
        }),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2),
            side: BorderSide(color: Colors.black38),
          ),
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: onTap,
      icon: PhosphorIcon(icon, size: 16),
    );
  }
}
