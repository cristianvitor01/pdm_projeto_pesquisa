import 'dart:async';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'package:pdm_projeto_pesquisa/models/meta.dart';

class MetasSemanaisController extends GetxController {
  final RxList<Meta> metasSemanais = <Meta>[].obs;

  late Box<Meta> _box;
  late StreamSubscription<BoxEvent> _subscription;

  @override
  void onInit() {
    super.onInit();
    _abrirBox();
  }

  @override
  void onClose() {
    _subscription.cancel();
    super.onClose();
  }

  void _abrirBox() {
    _box = Hive.box<Meta>('metas');
    _carregarMetasSemanais();
    
    _subscription = _box.watch().listen((_) {
      _carregarMetasSemanais();
    });
  }

  void _carregarMetasSemanais() {
    metasSemanais.value = _box.values
        .where((meta) => faltaUmaSemana(meta.periodo))
        .toList();
  }

  void atualizar() {
    _carregarMetasSemanais();
  }


  bool faltaUmaSemana(String? dataFinal) {
    if (dataFinal == null || dataFinal.isEmpty) return false;

    try {
      final partes = dataFinal.split('/');
      if (partes.length != 3) return false;

      final dia = int.parse(partes[0]);
      final mes = int.parse(partes[1]);
      final ano = int.parse(partes[2]);

      final agora = DateTime.now();
      
      final hoje = DateTime(agora.year, agora.month, agora.day);
      final dataMeta = DateTime(ano, mes, dia);

      final diferenca = dataMeta.difference(hoje).inDays;

      return diferenca >= 0 && diferenca <= 7;
    } catch (e) {
      return false;
    }
  }

}