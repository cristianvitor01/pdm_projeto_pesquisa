import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdm_projeto_pesquisa/controllers/metas_controller.dart';
import 'package:pdm_projeto_pesquisa/models/meta.dart';

class MetaDropdown extends StatelessWidget {
  MetaDropdown({
    super.key,
    required this.metaSelecionada,
  });

  final Rx<Meta?> metaSelecionada;
  final MetasController metasController = Get.find<MetasController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (metasController.metas.isEmpty) {
        return const Text(
          'Nenhuma meta cadastrada',
          style: TextStyle(color: Colors.red),
        );
      }

      return DropdownButtonFormField<Meta>(
        decoration: const InputDecoration(
          labelText: 'Meta Relacionada',
          border: OutlineInputBorder(),
        ),
        initialValue: metaSelecionada.value,
        items: metasController.metas.map((meta) {
          return DropdownMenuItem<Meta>(
            value: meta,
            child: Text(meta.nome),
          );
        }).toList(),
        onChanged: (meta) {
          metaSelecionada.value = meta;
        },
      );
    });
  }
}
