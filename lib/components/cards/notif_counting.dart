import 'package:flutter/material.dart';

class NotifCounting extends StatelessWidget {
  final int count;
  const NotifCounting({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    final defaultSize = 16.0;

    final displayText = count > 99 ? '99+' : count.toString();

    return Container(
      height: defaultSize,
      padding: EdgeInsets.symmetric(horizontal: 3),
      constraints: BoxConstraints(minWidth: defaultSize),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color(0xFFFC3636),
        borderRadius: BorderRadius.circular(360),
        border: Border.all(color: Colors.white, width: 1),
      ),
      child: Text(
        displayText,
        style: TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
