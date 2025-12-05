import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdm_projeto_pesquisa/utils/app_colors.dart';
import 'package:pdm_projeto_pesquisa/widgets/app_drawer.dart';
import 'package:pdm_projeto_pesquisa/widgets/elevatedbuttom.dart';
import 'package:pdm_projeto_pesquisa/widgets/textfieldcustom_login.dart';
import 'package:pdm_projeto_pesquisa/routers/pages.dart';
import 'package:pdm_projeto_pesquisa/widgets/card_aviso.dart';

class RealizarCheckOut extends StatelessWidget {
  const RealizarCheckOut ({super.key});

  @override
  
  Widget build(BuildContext context) {
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
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 200),
              CardAviso(
                  mensagem: '00:22:06 em atividade',
                    width: 400,
                    height: 80,
                    color: AppColors.green,
                  ),

              const SizedBox(height: 10),

              // Nome da meta
              CustomTextFieldLogin(
                hintText: "Pesquisa",
                keyboardType: TextInputType.none,
              ),
              const SizedBox(height: 20),

              //Meta relacionada
              CustomTextFieldLogin(
                hintText: "Pesquisa em Laboratório",
                keyboardType: TextInputType.none,
              ),
              const SizedBox(height: 20),

              // Botão Check-Out
              CustomElevatedButton(
                text: "Realizar Check-Out",
                onPressed: () {
                  // Voltar para a tela de Check IN
                  Get.offAllNamed(Routes.CHECK_IN);
                  // arguments: "Check-out realizado com sucesso";
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
