import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pdm_projeto_pesquisa/models/check_in_model.dart';
import 'package:pdm_projeto_pesquisa/utils/app_colors.dart';
import 'package:pdm_projeto_pesquisa/widgets/app_drawer.dart';

class MetaHistoricoInDepthPage extends StatelessWidget {
  const MetaHistoricoInDepthPage({super.key});

  String formatarData(DateTime data) {
    return "${data.day.toString().padLeft(2, '0')}/"
        "${data.month.toString().padLeft(2, '0')}/"
        "${data.year}";
  }

  String formatarHora(DateTime data) {
    return "${data.hour.toString().padLeft(2, '0')}:"
        "${data.minute.toString().padLeft(2, '0')}";
  }

  Widget _infoBox(String text, {double height = 60}) {
    return Container(
      width: double.infinity,
      height: height,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey.shade400,
          width: 1,
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final CheckInModel checkin = Get.arguments as CheckInModel;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Histórico da Meta',
          style: TextStyle(color: AppColors.white),
        ),
        backgroundColor: AppColors.green,
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            _infoBox("Data: ${formatarData(checkin.data)}"),
            _infoBox("Horário de Início: ${formatarHora(checkin.data)}"),
            _infoBox("Relatório: ${checkin.nome}", height: 120),
          ],
        ),
      ),
    );
  }
}
