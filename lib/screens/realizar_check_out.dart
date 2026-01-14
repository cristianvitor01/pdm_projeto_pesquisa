import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pdm_projeto_pesquisa/utils/app_colors.dart';
import 'package:pdm_projeto_pesquisa/widgets/app_drawer.dart';
import 'package:pdm_projeto_pesquisa/widgets/elevatedbuttom.dart';
import 'package:pdm_projeto_pesquisa/widgets/textfieldcustom.dart';
import 'package:pdm_projeto_pesquisa/routers/pages.dart';
import 'package:pdm_projeto_pesquisa/widgets/card_aviso.dart';
import 'package:pdm_projeto_pesquisa/controllers/check_in_controller.dart';
import 'package:pdm_projeto_pesquisa/utils/location_service.dart';

class RealizarCheckOut extends StatelessWidget {
  RealizarCheckOut({super.key});

  final CheckInController controller = Get.find();
  final localController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
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
                ? const Center(child: Text("Nenhum check-in encontrado"))
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Obx(() => SizedBox(
                            height: controller.precisaConfirmarPresenca.value ? 0 : 150,
                          )),

                      //  AVISO DE CONFIRMAÇÃO 
                      Obx(() {
                        if (controller.precisaConfirmarPresenca.value) {
                          return Container(
                            width: double.infinity,
                            margin: const EdgeInsets.only(bottom: 20),
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.amber.withOpacity(0.2),
                              border: Border.all(color: Colors.amber),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              children: [
                                const Icon(Icons.warning_amber_rounded, size: 40, color: Colors.amber),
                                const SizedBox(height: 5),
                                const Text(
                                  "Confirmação Necessária!",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  controller.cronometroPausado.value
                                      ? "ATIVIDADE PAUSADA: Valide sua localização para retomar."
                                      : "Valide sua localização abaixo para continuar contando o tempo.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: controller.cronometroPausado.value ? Colors.red : Colors.black87,
                                    fontWeight: controller.cronometroPausado.value ? FontWeight.bold : FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                        return const SizedBox.shrink();
                      }),

                      //CARD DO TIMER 
                      Obx(() => CardAviso(
                            mensagem: controller.cronometroPausado.value
                                ? "PAUSADO: ${controller.tempoFormatado.value}"
                                : "${controller.tempoFormatado.value} em atividade",
                            width: double.infinity,
                            height: 80,
                            color: controller.cronometroPausado.value ? Colors.redAccent : const Color.fromARGB(255, 31, 187, 140),
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

                      GestureDetector(
                        onTap: () async {
                          localController.text = "Obtendo GPS...";

                          bool permitido = await LocationService.estaNoPerimetroPermitido();

                          if (!permitido) {
                            localController.clear();
                            Get.snackbar(
                              'Localização Inválida',
                              'Você não está no perímetro permitido.',
                              backgroundColor: Colors.red.withOpacity(0.6),
                              colorText: Colors.white,
                            );
                            return;
                          }

                          Position? position = await LocationService.getCurrentLocation();
                          if (position != null) {
                            localController.text = 'Lat: ${position.latitude}, Lng: ${position.longitude}';
                          } else {
                            localController.clear();
                            Get.snackbar('Erro', 'Não foi possível obter a localização exata.');
                          }
                        },
                        child: AbsorbPointer(
                          child: TextField(
                            controller: localController,
                            style: const TextStyle(color: Colors.black87),
                            decoration: const InputDecoration(
                              labelText: 'Toque aqui para validar Localização',
                              hintText: 'Aguardando validação...',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.location_on, color: AppColors.green),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),

                      Obx(() {
                        if (controller.precisaConfirmarPresenca.value) {
                          return Column(
                            children: [
                              CustomElevatedButton(
                                text: "Confirmar Presença",
                                onPressed: () async {
                                  if (localController.text.isEmpty) {
                                    Get.snackbar(
                                      "Validação Necessária",
                                      "Toque no campo de localização antes de continuar.",
                                      backgroundColor: Colors.red.withOpacity(0.6),
                                      colorText: Colors.white,
                                    );
                                    return;
                                  }

                                  bool permitido = await LocationService.estaNoPerimetroPermitido();
                                  if (!permitido) {
                                    Get.snackbar("Erro", "Você saiu do local permitido.");
                                    return;
                                  }

                                  controller.confirmarPresencaUsuario();
                                  localController.clear();
                                },
                              ),
                              const SizedBox(height: 15),
                              const Divider(),
                              const SizedBox(height: 15),
                            ],
                          );
                        }
                        return const SizedBox.shrink();
                      }),

                      CustomElevatedButton(
                        text: "Finalizar Atividade (Check-Out)",
                        onPressed: () async {
                          if (localController.text.isEmpty) {
                            Get.snackbar(
                              "Validação Necessária",
                              "Para sair, valide sua localização atual no campo acima.",
                              backgroundColor: Colors.red.withOpacity(0.6),
                              colorText: Colors.white,
                            );
                            return;
                          }

                          bool permitido = await LocationService.estaNoPerimetroPermitido();
                          if (!permitido) {
                            Get.snackbar(
                              "Erro ao Sair",
                              "Você deve estar no local da atividade para fazer Check-Out.",
                              backgroundColor: Colors.red.withOpacity(0.6),
                              colorText: Colors.white,
                            );
                            return;
                          }

                          // CHAMA A NOVA FUNÇÃO QUE CONTABILIZA O TEMPO
                          controller.finalizarAtividadeEContabilizar();
                          
                          Get.offAllNamed(Routes.CHECK_IN);

                          Get.snackbar(
                            "Check-Out",
                            "Atividade finalizada e tempo contabilizado na meta!",
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
    });
  }
}