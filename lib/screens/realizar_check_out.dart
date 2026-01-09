import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdm_projeto_pesquisa/utils/app_colors.dart';
import 'package:pdm_projeto_pesquisa/widgets/app_drawer.dart';
import 'package:pdm_projeto_pesquisa/widgets/elevatedbuttom.dart';
import 'package:pdm_projeto_pesquisa/widgets/textfieldcustom.dart';
import 'package:pdm_projeto_pesquisa/routers/pages.dart';
import 'package:pdm_projeto_pesquisa/widgets/card_aviso.dart';
import 'package:pdm_projeto_pesquisa/controllers/check_in_controller.dart';


class RealizarCheckOut extends StatelessWidget {
  RealizarCheckOut({super.key});

  final CheckInController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final checkIn = controller.ultimoCheckIn;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Check-Out',
          style: TextStyle(color: AppColors.white),
        ),
        backgroundColor: AppColors.green,
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: checkIn == null
              ? const Center(
                  child: Text("Nenhum check-in encontrado"),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 200),

                    Obx(()=> CardAviso(
                      mensagem: "${controller.tempoFormatado.value} em atividade",
                      width: 400,
                      height: 80,
                      color: AppColors.green,
                    )),

                    const SizedBox(height: 10),

                    CustomTextField(
                      hintText: checkIn.nome,
                      keyboardType: TextInputType.none,
                      isLoginStyle: true,
                    ),
                    const SizedBox(height: 20),

                    CustomTextField(
                      hintText: checkIn.metaRelacionada,
                      keyboardType: TextInputType.none,
                      isLoginStyle: true,
                    ),
                    const SizedBox(height: 20),

                    CustomTextField(
                      hintText: checkIn.localizacao,
                      keyboardType: TextInputType.none,
                      isLoginStyle: true,
                    ),
                    const SizedBox(height: 20),

                    CustomElevatedButton(
                    text: "Realizar Check-Out",
                    onPressed: () {
                      controller.removerUltimoCheckIn();

                      Get.offAllNamed(Routes.CHECK_IN);

                      Get.snackbar(
                        "Check-Out",
                        "Atividade finalizada com sucesso!",
                        backgroundColor: Colors.green.withOpacity(0.5),
                        colorText: Colors.white,
                      );
                    },
                  ),

                    const SizedBox(height: 30),
                  ],
                ),
        ),
      ),
    );
  }
}

