import 'package:flutter/material.dart';
import 'package:pdm_projeto_pesquisa/utils/app_colors.dart';

class CardAviso extends StatelessWidget {
  final String mensagem;
  final double? width;
  final double? height;
  final EdgeInsets padding;
  final BorderRadius borderRadius;
  final TextAlign textAlign;
  final Color? color;

  const CardAviso({
    super.key,
    required this.mensagem,
    this.width,
    this.height,
    this.padding = const EdgeInsets.all(16.0),
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.textAlign = TextAlign.center,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
      color: color ?? AppColors.orange,
        borderRadius: borderRadius,
      ),
      child: Center(
        child: Text(
          mensagem,
          textAlign: textAlign,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
