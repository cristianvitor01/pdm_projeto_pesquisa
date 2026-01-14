import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

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

  Widget _infoBox(
    Color color,
    String text, {
    double height = 60,
    bool withShadow = false,
  }) {
    return Container(
      width: double.infinity,
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        boxShadow: withShadow
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,
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

    if (result != null && result.files.single.path != null) {
      setState(() {
        arquivoPath = result.files.single.path;
        arquivoNome = result.files.single.name;
      });
    }
  }
  
  Future<void> enviarEmail() async {

    String corpoDoEmail = '''
      Olá,

      Segue em anexo o relatório da meta finalizada.

      DETALHES DA META:
      ------------------------------------------------
      Nome: ${meta.nome}
      Projeto: ${meta.projeto}
      Período: ${meta.periodo}
      Carga Horária: ${meta.cargaHoraria}h

      Descrição:
      ${meta.descricao}

      Resultados Esperados:
      ${meta.resultadosEsperados}
      ------------------------------------------------
      ''';
    final Email email = Email(
      body: corpoDoEmail, 
      subject: 'Relatório de Meta: ${meta.nome}',
      // recipients: ['isaaclevi@acad.ifma.edu.br'],
      recipients: ['ycarolourenco@acad.ifma.edu.br'],
      attachmentPaths: [arquivoPath!],
      isHTML: false,
    );

    await FlutterEmailSender.send(email);
  }

  void deletarMeta() {
    final controller = Get.find<MetasController>();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Confirmar'),
          content: const Text('Deseja realmente deletar esta meta?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                controller.removerMeta(meta);
                Navigator.of(context).pop();
                Get.offAllNamed(Routes.HOME);
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.red,
              ),
              child: const Text('Sim'),
            ),
          ],
        );
      },
    );
  }

  void finalizarMeta() async {
    if (arquivoPath == null) {
      Get.snackbar(
        'Relatório obrigatório',
        'É necessário anexar um relatório para finalizar a meta',
        backgroundColor: Colors.red.withOpacity(0.6),
        colorText: Colors.white,
      );
      return;
    }

    await enviarEmail();
    Get.offAllNamed(Routes.HOME);
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
                withShadow: true,
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
              // width: double.infinity,
              // height: 55,
              // child: ElevatedButton(
              //   onPressed: () {
              //     Get.toNamed(Routes.META_HISTORICO);
              //   },
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: Colors.white,
              //     foregroundColor: AppColors.green,
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(12),
              //     ),
              //   ),
              //   child: const Text(
              //     "Histórico de Meta",
              //     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              //   ),
              // ),
            ),
            SizedBox(
              height: 55,
              child: CustomElevatedButton(
                text: "Finalizar Meta",
                onPressed: finalizarMeta,
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}