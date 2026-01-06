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
    metasSemanais.value =
        _box.values.where((meta) => meta.isSemanal).toList();
  }

  void atualizar() {
    _carregarMetasSemanais();
  }
}