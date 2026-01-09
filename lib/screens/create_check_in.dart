import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

import 'package:pdm_projeto_pesquisa/controllers/check_in_controller.dart';
import 'package:pdm_projeto_pesquisa/models/meta.dart';
import 'package:pdm_projeto_pesquisa/utils/app_colors.dart';
import 'package:pdm_projeto_pesquisa/widgets/app_drawer.dart';
import 'package:pdm_projeto_pesquisa/widgets/elevatedbuttom.dart';
import 'package:pdm_projeto_pesquisa/widgets/meta_dropdown.dart';
import 'package:pdm_projeto_pesquisa/utils/location_service.dart';

class CreateCheckIn extends StatelessWidget {
  CreateCheckIn({super.key});

  final nomeController = TextEditingController();
  final localController = TextEditingController();

  final CheckInController checkInController = Get.find();

  final Rx<Meta?> metaSelecionada = Rx<Meta?>(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Novo Check-In',
          style: TextStyle(color: AppColors.white),
        ),
        backgroundColor: AppColors.green,
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 250),

            TextField(
              controller: nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome da Atividade',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            MetaDropdown(metaSelecionada: metaSelecionada),

            const SizedBox(height: 20),

            GestureDetector(
              onTap: () async {
                bool permitido =
                    await LocationService.estaNoPerimetroPermitido();

                if (!permitido) {
                  Get.snackbar(
                    'Localização inválida',
                    'Você não está no local permitido',
                    backgroundColor: Colors.red.withOpacity(0.6),
                    colorText: Colors.white,
                  );
                  return;
                }

                Position? position =
                    await LocationService.getCurrentLocation();

                if (position != null) {
                  localController.text =
                      'Lat: ${position.latitude}, Lng: ${position.longitude}';
                }
              },
              child: AbsorbPointer(
                child: TextField(
                  controller: localController,
                  decoration: const InputDecoration(
                    labelText: 'Localização (toque para validar)',
                    border: OutlineInputBorder(),
                    prefixIcon:
                        Icon(Icons.location_on, color: AppColors.green),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            CustomElevatedButton(
              text: 'Confirmar Local',
              onPressed: () async {
                if (nomeController.text.isEmpty ||
                    metaSelecionada.value == null ||
                    localController.text.isEmpty) {
                  Get.snackbar('Erro', 'Preencha todos os campos');
                  return;
                }

                bool permitido =
                    await LocationService.estaNoPerimetroPermitido();

                if (!permitido) {
                  Get.snackbar(
                    'Check-in bloqueado',
                    'Você não está no local autorizado',
                    backgroundColor: Colors.red.withOpacity(0.6),
                    colorText: Colors.white,
                  );
                  return;
                }

                checkInController.adicionarCheckIn(
                  nomeController.text,
                  metaSelecionada.value!.nome,
                  localController.text,
                );

                nomeController.clear();
                localController.clear();
                metaSelecionada.value = null;

                Get.back();

                Get.snackbar(
                  'Sucesso',
                  'Check-in realizado com GPS!',
                  backgroundColor: Colors.green.withOpacity(0.5),
                  colorText: Colors.white,
                );
              },
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
