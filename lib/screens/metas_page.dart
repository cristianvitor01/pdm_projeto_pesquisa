import 'package:flutter/material.dart';
import 'package:pdm_projeto_pesquisa/utils/app_colors.dart';
import 'package:pdm_projeto_pesquisa/widgets/app_drawer.dart';
import 'package:pdm_projeto_pesquisa/widgets/card_meta.dart';
import 'package:pdm_projeto_pesquisa/widgets/elevatedbuttom.dart';

class MetasPage extends StatelessWidget {
  const MetasPage({super.key});

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
                  CardMeta(
                    title: 'Pesquisa em laboratório',
                    deadline: '01/12/2025',
                    progressValue: 0,
                    onTap: () {
                      // Lógica de navegação ou ação ao clicar no card
                      print('Abrir detalhes da meta...');
                    },
                  ),
                  const SizedBox(height: 30),
                  CardMeta(
                    title: 'Coleta de amostra',
                    deadline: '01/10/2025',
                    progressValue: 0,
                    onTap: () {
                      // Lógica de navegação ou ação ao clicar no card
                      print('Abrir detalhes da meta...');
                    },
                  ),

                  const SizedBox(height: 30),

                  // Botão de login
                  CustomElevatedButton(
                    text: 'Nova Meta',
                    onPressed: () {
                      // Get.toNamed(Routes.HOME);
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
