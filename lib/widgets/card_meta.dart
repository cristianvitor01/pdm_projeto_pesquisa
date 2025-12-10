import 'package:flutter/material.dart';
import 'package:pdm_projeto_pesquisa/utils/app_colors.dart';

class CardMeta extends StatelessWidget {
  final String title;
  final String deadline;
  final double progressValue;
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final EdgeInsets padding;
  final BorderRadius borderRadius;

  const CardMeta({
    super.key,
    required this.title,
    required this.deadline,
    required this.progressValue,
    this.onTap,
    this.width,
    this.height,
    this.padding = const EdgeInsets.all(16.0),
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: borderRadius,
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
        child: Container(
          width: width,
          height: height,
          padding: padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // 1. Título e Ícone de Navegação
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: AppColors.darkBlue,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Icon(
                    Icons.chevron_right,
                    color: AppColors.gray,
                    size: 30,
                  ),
                ],
              ),
              
              const SizedBox(height: 8),

              // 2. Subtítulo (Horas)
              const Text(
                'Horas',
                style: TextStyle(
                  color: AppColors.darkBlue,
                  fontSize: 14,
                ),
              ),
  
              const SizedBox(height: 12),

              // 3. Barra de Progresso
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: LinearProgressIndicator(
                  value: progressValue.clamp(0.0, 1.0), 
                  backgroundColor: AppColors.lightGreen,
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    AppColors.lightGreen,
                  ),
                  minHeight: 8, // Altura da barra
                ),
              ),

              const SizedBox(height: 12),

              // 4. Data Limite
              Text(
                'Finalizar até o dia $deadline',
                style: const TextStyle(
                  color: AppColors.gray,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}