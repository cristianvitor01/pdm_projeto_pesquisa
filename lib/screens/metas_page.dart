import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pdm_projeto_pesquisa/controllers/metas_controller.dart';
import 'package:pdm_projeto_pesquisa/utils/app_colors.dart';
import 'package:pdm_projeto_pesquisa/widgets/app_drawer.dart';
import 'package:pdm_projeto_pesquisa/widgets/card_meta.dart';
import 'package:pdm_projeto_pesquisa/widgets/elevatedbuttom.dart';
import 'package:pdm_projeto_pesquisa/routers/pages.dart';

class MetasPage extends StatelessWidget {
  MetasPage({super.key});

  final MetasController controller = Get.find<MetasController>();

  String formatarHoras(int segundos) {
    final int horas = segundos ~/ 3600;
    final int minutos = (segundos % 3600) ~/ 60;

    if (horas > 0) {
    return "Tempo decorrido: ${horas} h ${minutos} min";
    } else {
    return "Tempo decorrido: ${minutos} min";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Metas', style: TextStyle(color: AppColors.white)),
        backgroundColor: AppColors.green,
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 250),

            Expanded(
              child: Obx(() {
                if (controller.metas.isEmpty) {
                  return const Center(
                    child: Text('Nenhuma meta cadastrada'),
                  );
                }

                return ListView.builder(
                  itemCount: controller.metas.length,
                  itemBuilder: (context, index) {
                    final meta = controller.metas[index];

                    final String horasTexto =
                        formatarHoras(meta.segundosCumpridos);

                    double progresso = 0.0;
                    final double cargaHoras =
                        double.tryParse(meta.cargaHoraria) ?? 0;

                    if (cargaHoras > 0) {
                      progresso =
                          meta.segundosCumpridos / (cargaHoras * 3600);
                    }

                    if (progresso > 1.0) progresso = 1.0;

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: CardMeta(
                        title: meta.nome,
                        subtitle: horasTexto,
                        deadline: meta.periodo,
                        width: 400,
                        height: 150,
                        progressValue: progresso,
                        onTap: () {
                          Get.toNamed(
                            Routes.DETALHES_DA_META,
                            arguments: meta,
                          );
                        },
                      ),
                    );
                  },
                );
              }),
            ),

            CustomElevatedButton(
              text: 'Nova Meta',
              onPressed: () {
                Get.toNamed(
                  Routes.CREATE_META,
                  arguments: false,
                );
              },
            ),

            const SizedBox(height: 70),
          ],
        ),
      ),
    );
  }
}
