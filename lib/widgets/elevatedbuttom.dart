import 'package:flutter/material.dart';
import 'package:pdm_projeto_pesquisa/utils/app_colors.dart';


class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed; 
  final Color backgroundColor;
  final Color foregroundColor;
  final double height;
  final double? width; 
  final double borderRadius;
  final double fontSize;
  final FontWeight fontWeight;

  const CustomElevatedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = AppColors.green,
    this.foregroundColor = Colors.white,
    this.height = 65,
    this.width = double.infinity, 
    this.borderRadius = 10,
    this.fontSize = 18,
    this.fontWeight = FontWeight.w800,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed, 
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        minimumSize: Size(width ?? 0, height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        elevation: 2, 
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}