import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pdm_projeto_pesquisa/controllers/metas_controller.dart';
import 'package:pdm_projeto_pesquisa/models/meta.dart';
import 'package:pdm_projeto_pesquisa/utils/app_colors.dart';
import 'package:pdm_projeto_pesquisa/widgets/app_drawer.dart';
import 'package:pdm_projeto_pesquisa/widgets/elevatedbuttom.dart';
import 'package:pdm_projeto_pesquisa/widgets/textfieldcustom.dart';

class CadastrarMetas extends StatelessWidget {
  CadastrarMetas({super.key});

  // Controllers dos campos
  final nomeController = TextEditingController();
  final projetoController = TextEditingController();
  final cargaHorariaController = TextEditingController();
  final periodoController = TextEditingController();
  final descricaoController = TextEditingController();
  final resultadosController = TextEditingController();

  // Controller de metas
  final MetasController metasController = Get.find<MetasController>();

  @override
  Widget build(BuildContext context) {
    // true = meta semanal | false = meta normal
    final bool isSemanal = Get.arguments ?? false;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isSemanal ? 'Cadastrar Meta Semanal' : 'Cadastrar Meta',
          style: const TextStyle(color: AppColors.white),
        ),
        backgroundColor: AppColors.green,
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            CustomTextField(
              hintText: 'Nome da Meta',
              controller: nomeController,
            ),
            const SizedBox(height: 20),

            CustomTextField(
              hintText: 'Projeto',
              controller: projetoController,
            ),
            const SizedBox(height: 20),

            CustomTextField(
              hintText: 'Carga horária da meta',
              controller: cargaHorariaController,
            ),
            const SizedBox(height: 20),

            CustomTextField(
              hintText: 'Período da Meta',
              controller: periodoController,
            ),
            const SizedBox(height: 20),

            CustomTextField(
              hintText: 'Descrição da meta',
              controller: descricaoController,
            ),
            const SizedBox(height: 20),

            CustomTextField(
              hintText: 'Resultados Esperados',
              controller: resultadosController,
            ),
            const SizedBox(height: 30),

            CustomElevatedButton(
              text: 'Salvar Meta',
              onPressed: () {
                final meta = Meta(
                  nome: nomeController.text,
                  projeto: projetoController.text,
                  cargaHoraria: cargaHorariaController.text,
                  periodo: periodoController.text,
                  descricao: descricaoController.text,
                  resultadosEsperados: resultadosController.text,
                  isSemanal: isSemanal,
                );

                metasController.adicionarMeta(meta);

                Get.back(); // volta para a tela anterior
              },
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}