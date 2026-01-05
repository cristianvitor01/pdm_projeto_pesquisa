import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdm_projeto_pesquisa/utils/app_colors.dart';
import 'package:pdm_projeto_pesquisa/widgets/app_drawer.dart';
import 'package:pdm_projeto_pesquisa/widgets/elevatedbuttom.dart';
import 'package:pdm_projeto_pesquisa/widgets/textfieldcustom.dart';
import 'package:pdm_projeto_pesquisa/routers/pages.dart';

class NovoFormularioPage extends StatelessWidget {
  const NovoFormularioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Novo Formulário',
          style: TextStyle(color: AppColors.white),
        ),
        backgroundColor: AppColors.green,
      ),
      drawer: const AppDrawer(),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 10),

              // Equipe
              CustomTextField(
                hintText: "Equipe:",
                keyboardType: TextInputType.text,
                isLoginStyle: true,
              ),
              const SizedBox(height: 20),

              // Data de coleta
              CustomTextField(
                hintText: "Data de Coleta:",
                keyboardType: TextInputType.datetime,
                isLoginStyle: true,
              ),
              const SizedBox(height: 20),

              // Localização
              CustomTextField(
                hintText: "Localização:",
                keyboardType: TextInputType.text,
                isLoginStyle: true,
              ),
              const SizedBox(height: 20),

              // Ponto de Referência
              CustomTextField(
                hintText: "Ponto de Referência:",
                keyboardType: TextInputType.text,
                isLoginStyle: true,
              ),
              const SizedBox(height: 20),

              // Observações
              CustomTextField(
                hintText: "Observações Pontuais:",
                keyboardType: TextInputType.text,
                isLoginStyle: true,
              ),
              const SizedBox(height: 20),

              // Adicionar imagem
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.gray, width: 1.5),
                ),
                child: TextButton(
                  onPressed: () {
                    debugPrint("Adicionar imagem pressionado");
                  },
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Adicionar imagem:",
                      style: TextStyle(
                        color: AppColors.gray,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Botão salvar
              CustomElevatedButton(
                text: "Salvar Formulário",
                onPressed: () {
                  // Voltar para a tela de Formulários
                  Get.offAllNamed(Routes.FORMULARIO_COLETA);
                  debugPrint("Formulário salvo e voltando à tela principal");
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
