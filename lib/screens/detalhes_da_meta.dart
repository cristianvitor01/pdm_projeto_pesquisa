import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pdm_projeto_pesquisa/models/meta.dart';
import 'package:pdm_projeto_pesquisa/utils/app_colors.dart';
import 'package:pdm_projeto_pesquisa/widgets/app_drawer.dart';
import 'package:pdm_projeto_pesquisa/widgets/elevatedbuttom.dart';
import 'package:pdm_projeto_pesquisa/routers/pages.dart';

class DetalhesDaMeta extends StatelessWidget {
  const DetalhesDaMeta({super.key});
  

    String formatarHoras(int segundos) {
    final horas = segundos ~/ 3600;
    final minutos = (segundos % 3600) ~/ 60;

    if (horas > 0) {
      return "${horas}h ${minutos}min";
    } else {
      return "${minutos}min";
    }
  }

  Widget _section(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: AppColors.green,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          content,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 25),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final Meta meta = Get.arguments as Meta;

    final String horasDecorridas = formatarHoras(meta.segundosCumpridos);

    final double cargaHoras = double.tryParse(meta.cargaHoraria) ?? 0;

    double progresso = 0;
    if (cargaHoras > 0) {
      progresso = (meta.segundosCumpridos / (cargaHoras * 3600)) * 100;
      if (progresso > 100) progresso = 100;
    }


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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _section("Nome da Meta", meta.nome),
            _section("Projeto", meta.projeto),
            _section("Período", meta.periodo),
            _section("Horas decorridas", horasDecorridas),
            _section(
              "Carga Horária Total",
              "${cargaHoras.toStringAsFixed(1)}h",
            ),
            _section(
              "Progresso",
              "${progresso.toStringAsFixed(1)}%",
            ),            
            _section("Descrição da Meta", meta.descricao),
            _section("Resultados Esperados", meta.resultadosEsperados),
          ],
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: CustomElevatedButton(
          text: "Finalizar Meta",
          onPressed: () {
            Get.toNamed(
              Routes.FINALIZAR_META,
              arguments: meta,
            );
          },
        ),
      ),
    );
  }
}
