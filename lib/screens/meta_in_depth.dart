import 'package:flutter/material.dart';
import 'package:pdm_projeto_pesquisa/utils/app_colors.dart';
import 'package:pdm_projeto_pesquisa/widgets/app_drawer.dart';
import 'package:pdm_projeto_pesquisa/widgets/elevatedbuttom.dart';
import 'package:pdm_projeto_pesquisa/routers/pages.dart';
import 'package:get/get.dart';

class MetaInDepthPage extends StatelessWidget {
  const MetaInDepthPage({super.key});

  Widget _infoBox(Color color, String text, {double height = 60}) {
    return Container(
      width: double.infinity,
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Color softBlueGrey = const Color(0xFFD8E2FF).withOpacity(0.5);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detalhes da Meta',
          style: TextStyle(color: AppColors.white),
        ),
        backgroundColor: AppColors.green,
      ),
      drawer: const AppDrawer(),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Column(
          children: [
            _infoBox(
              AppColors.green.withOpacity(0.25),
              "Em Andamento",
            ),
            _infoBox(
              softBlueGrey,
              "Data de Vencimento: 01/12/2025",
            ),
            _infoBox(
              softBlueGrey,
              "Anexar Relatório DOCX",
              height: 120, 
            ),

            const SizedBox(height: 60),
          ],
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.META_HISTORICO);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: AppColors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Histórico de Meta",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              height: 55,
              child: CustomElevatedButton(
                text: "Finalizar Meta",
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
