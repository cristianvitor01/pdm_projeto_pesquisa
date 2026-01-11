import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:pdm_projeto_pesquisa/models/meta.dart';
import 'package:pdm_projeto_pesquisa/utils/app_colors.dart';
import 'package:pdm_projeto_pesquisa/widgets/app_drawer.dart';
import 'package:pdm_projeto_pesquisa/widgets/elevatedbuttom.dart';
import 'package:pdm_projeto_pesquisa/routers/pages.dart';
import 'package:pdm_projeto_pesquisa/controllers/metas_controller.dart';

class FinalizarMeta extends StatefulWidget {
  const FinalizarMeta({super.key});

  @override
  State<FinalizarMeta> createState() => _FinalizarMetaState();
}

class _FinalizarMetaState extends State<FinalizarMeta> {

  String? arquivoPath;
  String? arquivoNome;

  late Meta meta;

  @override
  void initState() {
    super.initState();
    meta = Get.arguments as Meta;
  }

  Widget _infoBox(Color color, String text, {double height = 60}) {
    return Container(
      width: double.infinity,
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Future<void> selecionarArquivo() async {
    final result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        arquivoPath = result.files.single.path;
        arquivoNome = result.files.single.name;
      });
    }
  }

  Future<void> enviarEmail() async {
    final Uri email = Uri(
      scheme: 'mailto',
      path: 'isaaclevi@acad.ifma.edu.br',
      queryParameters: {
        'subject': 'Relatório de Meta',
        'body': 'Segue em anexo o relatório da meta.',
      },
    );

    await launchUrl(email);
  }

  void deletarMeta() {
    final controller = Get.find<MetasController>();

    Get.defaultDialog(
      title: "Confirmar",
      middleText: "Deseja realmente deletar esta meta?",
      textConfirm: "Sim",
      textCancel: "Cancelar",
      confirmTextColor: Colors.white,
      onConfirm: () {

        controller.removerMeta(meta);

        Get.back();
        Get.offAllNamed(Routes.HOME);
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detalhes da Meta',
          style: TextStyle(color: AppColors.white),
        ),
        backgroundColor: AppColors.green,
      ),
      drawer: const AppDrawer(),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Column(
          children: [

            _infoBox(
              AppColors.green.withOpacity(0.25),
              "Em Andamento",
            ),

            _infoBox(
              AppColors.lightBlueGray,
              "Data de Vencimento: ${meta.periodo}",
            ),

            GestureDetector(
              onTap: selecionarArquivo,
              child: _infoBox(
                AppColors.lightBlueGray,
                arquivoNome == null
                    ? "Anexar Relatório DOCX"
                    : "Arquivo: $arquivoNome",
                height: 120,
              ),
            ),

            const SizedBox(height: 60),
          ],
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: deletarMeta,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Deletar Meta",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.META_HISTORICO);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: AppColors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Histórico de Meta",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              height: 55,
              child: CustomElevatedButton(
                text: "Finalizar Meta",
                onPressed: arquivoPath == null
                    ? null
                    : () async {
                        await enviarEmail();
                        Get.offAllNamed(Routes.HOME);
                      },
              ),
            )
          ],
        ),
      ),
    );
  }
}
