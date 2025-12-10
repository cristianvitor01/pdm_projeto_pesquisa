import 'package:flutter/material.dart';
import 'package:pdm_projeto_pesquisa/utils/app_colors.dart';
import 'package:pdm_projeto_pesquisa/widgets/app_drawer.dart';
import 'package:pdm_projeto_pesquisa/widgets/elevatedbuttom.dart';
import 'package:pdm_projeto_pesquisa/widgets/textfieldcustom.dart';

class CadastrarProjeto extends StatelessWidget {
  const CadastrarProjeto({super.key});

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
                    hintText: 'Nome do projeto',
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 30),
                  CustomTextField(
                    hintText: 'Equipe',
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 30),
                  CustomTextField(
                    hintText: 'Orientador',
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 30),
                  CustomTextField(
                    hintText: 'Período',
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 30),

                  // Botão de salvar
                  CustomElevatedButton(
                    text: 'Salvar Meta',
                    onPressed: () {
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
