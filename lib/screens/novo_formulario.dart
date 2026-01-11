import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdm_projeto_pesquisa/utils/app_colors.dart';
import 'package:pdm_projeto_pesquisa/widgets/app_drawer.dart';
import 'package:pdm_projeto_pesquisa/widgets/elevatedbuttom.dart';
import 'package:pdm_projeto_pesquisa/routers/pages.dart';

class NovoFormularioPage extends StatelessWidget {
  NovoFormularioPage({super.key});

  // Controllers
  final equipeController = TextEditingController();
  final dataController = TextEditingController();
  final localizacaoController = TextEditingController();
  final referenciaController = TextEditingController();
  final observacoesController = TextEditingController();

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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 30),

            TextField(
              controller: equipeController,
              decoration: const InputDecoration(
                labelText: 'Equipe',
              ),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: dataController,
              keyboardType: TextInputType.datetime,
              decoration: const InputDecoration(
                labelText: 'Data de Coleta',
              ),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: localizacaoController,
              decoration: const InputDecoration(
                labelText: 'Localização',
              ),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: referenciaController,
              decoration: const InputDecoration(
                labelText: 'Ponto de Referência',
              ),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: observacoesController,
              decoration: const InputDecoration(
                labelText: 'Observações Pontuais',
              ),
            ),
            const SizedBox(height: 20),

            TextField(
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Adicionar imagem',
                suffixIcon: Icon(Icons.image),
              ),
              onTap: () {
                debugPrint('Adicionar imagem pressionado');
              },
            ),
            const SizedBox(height: 30),

            CustomElevatedButton(
              text: 'Salvar Formulário',
              onPressed: () {
                // Aqui futuramente pode salvar os dados
                Get.offAllNamed(Routes.FORMULARIO_COLETA);
                debugPrint('Formulário salvo');
              },
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}