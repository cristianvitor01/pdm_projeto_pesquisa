import 'package:flutter/material.dart';
import 'package:pdm_projeto_pesquisa/utils/app_colors.dart';
import 'package:pdm_projeto_pesquisa/widgets/app_drawer.dart';

class HistoricoFormulariosPage extends StatelessWidget {
  const HistoricoFormulariosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Histórico de Formulários',
          style: TextStyle(color: AppColors.white),
        ),
        backgroundColor: AppColors.green,
      ),
      drawer: const AppDrawer(),

      body: ListView(
        padding: const EdgeInsets.all(20),

        children: [
          const SizedBox(height: 250),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.green, width: 2),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Dia: 20/10/2025",
                  style: TextStyle(
                    color: AppColors.green,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(Icons.arrow_forward_ios, color: AppColors.green),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
