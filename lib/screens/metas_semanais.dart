import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pdm_projeto_pesquisa/controllers/metas_semanais_controller.dart';
import 'package:pdm_projeto_pesquisa/utils/app_colors.dart';
import 'package:pdm_projeto_pesquisa/widgets/app_drawer.dart';
import 'package:pdm_projeto_pesquisa/widgets/card_meta.dart';
import 'package:pdm_projeto_pesquisa/widgets/elevatedbuttom.dart';
import 'package:pdm_projeto_pesquisa/routers/pages.dart';

class MetasSemanais extends StatelessWidget {
  MetasSemanais({super.key});

  final MetasSemanaisController controller =
      Get.find<MetasSemanaisController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Metas semanais',
          style: TextStyle(color: AppColors.white),
        ),
        backgroundColor: AppColors.green,
      ),
      drawer: const AppDrawer(),
      body: Obx(
        () => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),

                  /// LISTA DE METAS SEMANAIS
                  if (controller.metasSemanais.isEmpty)
                    const Center(
                      child: Text(
                        'Nenhuma meta semanal cadastrada',
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  else
                    ...controller.metasSemanais.map(
                      (meta) => Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: CardMeta(
                          title: meta.nome,
                          deadline: meta.periodo,
                          width: 400,
                          height: 150,
                          progressValue: 0,
                          onTap: () {
                            debugPrint(
                              'Abrir detalhes da meta semanal: ${meta.nome}',
                            );
                          },
                        ),
                      ),
                    ),

                  const SizedBox(height: 60),

                  /// BOTÃO NOVA META SEMANAL
                  CustomElevatedButton(
                    text: 'Nova Meta',
                    onPressed: () {
                      Get.toNamed(
                        Routes.CREATE_META,
                        arguments: true, // <-- semanal
                      );
                    },
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}