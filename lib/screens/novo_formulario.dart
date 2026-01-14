import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

import 'package:pdm_projeto_pesquisa/utils/app_colors.dart';
import 'package:pdm_projeto_pesquisa/widgets/app_drawer.dart';
import 'package:pdm_projeto_pesquisa/widgets/elevatedbuttom.dart';
import 'package:pdm_projeto_pesquisa/routers/pages.dart';

class NovoFormularioPage extends StatefulWidget {
  const NovoFormularioPage({super.key});

  @override
  State<NovoFormularioPage> createState() => _NovoFormularioPageState();
}

class _NovoFormularioPageState extends State<NovoFormularioPage> {

  final equipeController = TextEditingController();
  final dataController = TextEditingController();
  final localizacaoController = TextEditingController();
  final referenciaController = TextEditingController();
  final observacoesController = TextEditingController();
  
  final imagemController = TextEditingController(); 

  List<String> arquivosPaths = [];

  @override
  void dispose() {
    equipeController.dispose();
    dataController.dispose();
    localizacaoController.dispose();
    referenciaController.dispose();
    observacoesController.dispose();
    imagemController.dispose();
    super.dispose();
  }

  Future<void> selecionarArquivos() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.image,
    );

    if (result != null) {

      List<String> caminhos = result.paths.whereType<String>().toList();
      
      String nomes = result.names.whereType<String>().join(', ');

      setState(() {
        arquivosPaths = caminhos;
        imagemController.text = nomes;
      });
    }
  }

  Future<void> abrirCalendario() async {
    DateTime? data = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (data != null) {
      dataController.text =
          '${data.day.toString().padLeft(2, '0')}/'
          '${data.month.toString().padLeft(2, '0')}/'
          '${data.year}';
    }
  }

  Future<void> enviarFormularioPorEmail() async {
    if (equipeController.text.isEmpty || dataController.text.isEmpty) {
      Get.snackbar(
        'Atenção', 
        'Preencha pelo menos a Equipe e a Data.',
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
      return;
    }

    String corpoDoEmail = '''
      NOVO FORMULÁRIO DE COLETA
      -------------------------------------
      Equipe: ${equipeController.text}
      Data da Coleta: ${dataController.text}
      Localização: ${localizacaoController.text}
      Ponto de Referência: ${referenciaController.text}

      Observações:
      ${observacoesController.text}
      -------------------------------------

      ''';
    final Email email = Email(
      body: corpoDoEmail,
      subject: 'Formulário de Coleta - ${equipeController.text}',
      recipients: ['ycarolourenco@acad.ifma.edu.br'],
      attachmentPaths: arquivosPaths,
      isHTML: false,
    );

    try {
      await FlutterEmailSender.send(email);
      Get.snackbar('Sucesso', 'E-mail preparado para envio!');
      Get.offAllNamed(Routes.FORMULARIO_COLETA);
    } catch (error) {
      Get.snackbar('Erro', 'Não foi possível abrir o app de e-mail.');
      debugPrint(error.toString());
    }
  }

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
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: dataController,
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Data de Coleta',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.calendar_today),
              ),
              onTap: abrirCalendario,
            ),
            
            const SizedBox(height: 20),

            TextField(
              controller: localizacaoController,
              decoration: const InputDecoration(
                labelText: 'Localização',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: referenciaController,
              decoration: const InputDecoration(
                labelText: 'Ponto de Referência',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: observacoesController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Observações Pontuais',
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: imagemController,
              readOnly: true,
              decoration: InputDecoration(
                labelText: arquivosPaths.isEmpty 
                    ? 'Adicionar imagens' 
                    : '${arquivosPaths.length} imagens selecionadas',
                hintText: 'Toque para selecionar',
                suffixIcon: const Icon(Icons.image, color: AppColors.green),
                border: const OutlineInputBorder(),
              ),
              onTap: selecionarArquivos, 
            ),
            
            const SizedBox(height: 30),

            CustomElevatedButton(
              text: 'Enviar Formulário',
              onPressed: enviarFormularioPorEmail,
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}