import 'package:flutter/material.dart';
import 'package:pdm_projeto_pesquisa/utils/app_colors.dart';
import 'package:pdm_projeto_pesquisa/widgets/app_drawer.dart';
import 'package:pdm_projeto_pesquisa/routers/pages.dart';
import 'package:get/get.dart';
import 'package:pdm_projeto_pesquisa/controllers/check_in_controller.dart';
import 'package:pdm_projeto_pesquisa/widgets/elevated_white_button.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {

    final CheckInController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Check-Out', style: TextStyle(color: AppColors.white)),
        backgroundColor: AppColors.green,
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  const Center(
                    child: Text(
                      "Atividades em andamento",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                  ),


                  Obx(() {
                    if (controller.checkIns.isEmpty){
                      
                      return const Text("Nenhuma atividade iniciada.");
                    }

                    return Column(
                      children: controller.checkIns.map((checkin){
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: CustomWhiteButton(
                            text: "${checkin.nome}",
                            onPressed: () {
                            Get.toNamed(Routes.REALIZAR_CHECK_OUT, arguments: checkin);
                          },
                        ),
                      );
                    }).toList(),
                  );
                })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
