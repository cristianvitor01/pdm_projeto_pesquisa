import 'package:flutter/material.dart';
import 'package:pdm_projeto_pesquisa/utils/app_colors.dart';

class CardMeta extends StatelessWidget {
  final String title;
  final String subtitle;
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
    required this.subtitle,
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
            children: [
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
              
              Text(
                subtitle,
                style: const TextStyle(
                  color: AppColors.darkBlue,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 12),

              // BARRA DE PROGRESSO
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: LinearProgressIndicator(
                  value: progressValue.clamp(0.0, 1.0),
                  backgroundColor: AppColors.lightGreen.withOpacity(0.3),
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    AppColors.green,
                  ),
                  minHeight: 8,
                ),
              ),

              const SizedBox(height: 12),

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
