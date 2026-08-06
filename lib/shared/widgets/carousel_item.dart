import 'package:appforro/shared/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class Carouselitem extends StatelessWidget {
  final String imagePath;
  final String text;

  const Carouselitem({super.key, required this.imagePath, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 160,
          width: 160,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipOval(
            child: Image.asset('assets/carousel/$imagePath', fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: 12),
        Text(text, style: AppTextStyles.title(fontSize: 18)),
      ],
    );
  }
}
