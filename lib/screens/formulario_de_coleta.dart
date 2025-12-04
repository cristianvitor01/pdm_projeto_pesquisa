import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdm_projeto_pesquisa/utils/app_colors.dart';
import 'package:pdm_projeto_pesquisa/widgets/app_drawer.dart';
import 'package:pdm_projeto_pesquisa/widgets/elevatedbuttom.dart';
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

              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.green, width: 2),
                ),
                child: TextButton(
                  onPressed: () {
                    Get.toNamed(Routes.HISTORICO_FORMULARIOS);
                  },
                  child: const Text(
                    'Histórico de Formulários',
                    style: TextStyle(
                      color: AppColors.green,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
