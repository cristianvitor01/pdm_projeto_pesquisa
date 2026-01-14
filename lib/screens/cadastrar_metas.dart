import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pdm_projeto_pesquisa/controllers/metas_controller.dart';
import 'package:pdm_projeto_pesquisa/models/meta.dart';
import 'package:pdm_projeto_pesquisa/utils/app_colors.dart';
import 'package:pdm_projeto_pesquisa/widgets/app_drawer.dart';
import 'package:pdm_projeto_pesquisa/widgets/elevatedbuttom.dart';
import 'package:flutter/services.dart';

class CadastrarMetas extends StatelessWidget {
  CadastrarMetas({super.key});

  final nomeController = TextEditingController();
  final projetoController = TextEditingController();
  final cargaHorariaController = TextEditingController();
  final periodoController = TextEditingController();
  final descricaoController = TextEditingController();
  final resultadosController = TextEditingController();

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
            const SizedBox(height: 130),

            TextField(
              controller: nomeController,
              decoration: InputDecoration(
                labelText: 'Nome da Meta',
                ),
              ),
            const SizedBox(height: 20),

            TextField(
              controller: projetoController,
              decoration: InputDecoration(
                labelText: 'Projeto',
                )
              ),
            const SizedBox(height: 20),

            TextField(
              controller: cargaHorariaController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],              
              decoration: InputDecoration(
                labelText: 'Carga horária da meta (horas)',
                )
              ),
            const SizedBox(height: 20),

            TextField(
              controller: periodoController,
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Data final da meta',
              ),
              onTap: () async {
                DateTime? data = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2100),
                );

                if (data != null) {
                  periodoController.text =
                      '${data.day.toString().padLeft(2, '0')}/'
                      '${data.month.toString().padLeft(2, '0')}/'
                      '${data.year}';
                }
              },
            ),

            const SizedBox(height: 20),

            TextField(
              controller: descricaoController,
              decoration: InputDecoration(
                labelText: 'Descrição da meta',
                )
              ),
            const SizedBox(height: 20),

            TextField(
              controller: resultadosController,
              decoration: InputDecoration(
                labelText: 'Resultados Esperados',
                )
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

                Get.back();
              },
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}