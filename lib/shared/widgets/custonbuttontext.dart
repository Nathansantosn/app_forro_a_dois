import 'package:flutter/material.dart';

class CustonButtonText extends StatelessWidget {
  const CustonButtonText({
    super.key,
    required this.text,
    required this.onPressed,
    required this.color,
  });

  final String text;
  final dynamic onPressed;
  final dynamic color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text, style: TextStyle(color: color, fontSize: 12)),
    );
  }
}
