import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdm_projeto_pesquisa/controllers/check_in_controller.dart';
import 'package:pdm_projeto_pesquisa/utils/app_colors.dart';
import 'package:pdm_projeto_pesquisa/widgets/app_drawer.dart';
import 'package:pdm_projeto_pesquisa/widgets/elevated_white_button.dart';
import 'package:pdm_projeto_pesquisa/widgets/elevatedbuttom.dart';
import 'package:pdm_projeto_pesquisa/routers/pages.dart';

class CheckIn extends StatelessWidget {
  const CheckIn({super.key});

  @override
  Widget build(BuildContext context) {
    final CheckInController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Check In', style: TextStyle(color: AppColors.white)),
        backgroundColor: AppColors.green,
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          child: IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Atividades em andamento',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),

                  Obx(() {
                    if (controller.checkIns.isEmpty) {
                      return const Text("Nenhuma atividade iniciada.");
                    }
                    // Gera uma lista de botões baseada no banco de dados
                    return Column(
                      children: controller.checkIns.map((checkin) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: CustomWhiteButton(
                            text: checkin.nome,
                            onPressed: () {
                              Get.toNamed(Routes.REALIZAR_CHECK_OUT, arguments: checkin);
                            },
                          ),
                        );
                      }).toList(),
                    );
                  }),

                  const SizedBox(height: 20),

                  CustomElevatedButton(
                    text: 'Novo Check-In',
                    onPressed: () {
                      Get.toNamed(Routes.CREATE_CHECK_IN);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}