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
            const SizedBox(height: 20),

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

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: CardMeta(
                        title: meta.nome,
                        deadline: meta.periodo,
                        width: 400,
                        height: 150,
                        progressValue: 0,
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

            const SizedBox(height: 10),

            CustomElevatedButton(
              text: 'Nova Meta',
              onPressed: () {
                Get.toNamed(
                  Routes.CREATE_META,
                  arguments: false,
                );
              },
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
