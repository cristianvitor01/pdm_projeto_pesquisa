import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdm_projeto_pesquisa/utils/app_colors.dart';
import 'package:pdm_projeto_pesquisa/widgets/app_drawer.dart';
import 'package:pdm_projeto_pesquisa/widgets/elevatedbuttom.dart';
import 'package:pdm_projeto_pesquisa/widgets/textfieldcustom_login.dart';
import 'package:pdm_projeto_pesquisa/routers/pages.dart';
import 'package:pdm_projeto_pesquisa/widgets/card_aviso.dart';

class CreateCheckIn extends StatelessWidget {
  const CreateCheckIn ({super.key});

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
        
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 200),


              const SizedBox(height: 10),

              CustomTextFieldLogin(
                hintText: "Nome da Atividade",
                keyboardType: TextInputType.none,
              ),
              const SizedBox(height: 20),


              CustomTextFieldLogin(
                hintText: "Meta Relacionda",
                keyboardType: TextInputType.none,
              ),
              const SizedBox(height: 20),

              CustomTextFieldLogin(
                hintText: "Localização",
                keyboardType: TextInputType.none,
                prefixIcon: Icon(Icons.location_on, color: AppColors.green),
              ),
              const SizedBox(height: 20),

              // Botão Check-Out
              CustomElevatedButton(
                text: "Confirmar Local",
                onPressed: () {
                  // Voltar para a tela de Check IN
                  Get.offAllNamed(Routes.CHECK_IN);
                  // arguments: "Check-out realizado com sucesso!";
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
