import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdm_projeto_pesquisa/utils/app_colors.dart';
import 'package:pdm_projeto_pesquisa/widgets/app_drawer.dart';
import 'package:pdm_projeto_pesquisa/widgets/elevatedbuttom.dart';
import 'package:pdm_projeto_pesquisa/widgets/elevated_white_button.dart';
import 'package:pdm_projeto_pesquisa/routers/pages.dart';

class FormularioDeColeta extends StatelessWidget {
  const FormularioDeColeta({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Formulário de Coleta',
          style: TextStyle(color: AppColors.white),
        ),
        backgroundColor: AppColors.green,
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomElevatedButton(
                text: 'Novo Formulário',
                onPressed: () {
                  Get.toNamed(Routes.NOVO_FORMULARIO);
                },
              ),

              const SizedBox(height: 20),

              CustomWhiteButton(
                text: 'Histórico de Formulários',
                onPressed: () {
                  Get.toNamed(Routes.HISTORICO_FORMULARIOS);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}