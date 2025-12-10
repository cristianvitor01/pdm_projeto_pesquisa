import 'package:get/get.dart';
import 'package:pdm_projeto_pesquisa/routers/pages.dart';
import 'package:flutter/material.dart';
import 'package:pdm_projeto_pesquisa/utils/app_colors.dart';
import 'package:pdm_projeto_pesquisa/widgets/app_drawer.dart';
import 'package:pdm_projeto_pesquisa/widgets/elevatedbuttom.dart';
import 'package:pdm_projeto_pesquisa/widgets/textfieldcustom.dart';

class CadastrarMetas extends StatelessWidget {
  const CadastrarMetas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar Metas', style: TextStyle(color: AppColors.white)),
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
                  // Campo de e-mail
                  CustomTextField(
                    hintText: 'Nome da Meta',
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    hintText: 'Projeto',
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    hintText: 'Carga horária da meta',
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    hintText: 'Período da Meta',
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    hintText: 'Descrição da meta',
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    hintText: 'Resultados Esperados',
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 20),

                  // Botão de login
                  CustomElevatedButton(
                    text: 'Salvar Meta',
                    onPressed: () {
                      Get.toNamed(Routes.HOME);
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
