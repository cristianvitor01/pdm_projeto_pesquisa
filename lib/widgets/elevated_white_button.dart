import 'package:flutter/material.dart';
import 'package:pdm_projeto_pesquisa/utils/app_colors.dart';

class CustomWhiteButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double height;
  final double? width;
  final double borderRadius;
  final double fontSize;
  final FontWeight fontWeight;

  const CustomWhiteButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.height = 70,
    this.width = double.infinity,
    this.borderRadius = 12,
    this.fontSize = 16,
    this.fontWeight = FontWeight.bold,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.2),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: AppColors.green,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
