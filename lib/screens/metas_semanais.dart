import 'package:flutter/material.dart';
import 'package:pdm_projeto_pesquisa/utils/app_colors.dart';
import 'package:pdm_projeto_pesquisa/widgets/app_drawer.dart';
import 'package:pdm_projeto_pesquisa/widgets/card_meta.dart';
import 'package:pdm_projeto_pesquisa/widgets/elevatedbuttom.dart';
import 'package:pdm_projeto_pesquisa/routers/pages.dart';
import 'package:get/get.dart';

class MetasSemanais extends StatelessWidget {
  const MetasSemanais({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Metas', style: TextStyle(color: AppColors.white)),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  CardMeta(
                    title: 'Pesquisa em laboratório.',
                    deadline: '01/12/2025',
                    width: 400,
                    height: 150,
                    progressValue: 0,
                    onTap: () {
                      // Lógica de navegação ou ação ao clicar no card
                      print('Abrir detalhes da meta...');
                    },
                  ),
                  
                  const SizedBox(height: 90),

                  // Botão de login
                  CustomElevatedButton(
                    text: 'Nova Meta',
                    onPressed: () {
                      Get.toNamed(Routes.CREATE_META);
                      debugPrint('entrar pressionado');
                    },
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
