import 'package:flutter/material.dart';

class MenuItemCard extends StatelessWidget {
  final Widget leading;
  final Widget title;
  final Widget? subtitle;
  final Widget? bottom;
  final Widget? trailing;

  const MenuItemCard({
    super.key,
    required this.leading,
    required this.title,
    this.subtitle,
    this.bottom,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Row(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          leading,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [title, ?subtitle, ?bottom],
            ),
          ),
          ?trailing,
        ],
      ),
    );
  }
}
