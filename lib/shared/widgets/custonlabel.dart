import 'package:flutter/material.dart';

class CustonLabel extends StatelessWidget {
  const CustonLabel({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 10,
        letterSpacing: 2,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
