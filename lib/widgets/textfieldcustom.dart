import 'package:flutter/material.dart';
import 'package:pdm_projeto_pesquisa/utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool enabled;
  final bool isLoginStyle;

  const CustomTextField({
    Key? key,
    required this.hintText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
    this.enabled = true,
    this.isLoginStyle = false, // novo parâmetro
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      enabled: enabled,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        hintText: hintText,

        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,

        filled: isLoginStyle,
        fillColor: isLoginStyle ? AppColors.white2 : null,
        
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: isLoginStyle
              ? BorderSide.none
              : const BorderSide(color: AppColors.gray3, width: 1),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: isLoginStyle
              ? BorderSide.none
              : const BorderSide(color: AppColors.gray3, width: 1),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColors.green,
            width: 2,
          ),
        ),
      ),
    );
  }
}
