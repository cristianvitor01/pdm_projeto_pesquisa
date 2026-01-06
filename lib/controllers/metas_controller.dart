import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'package:pdm_projeto_pesquisa/models/meta.dart';

class MetasController extends GetxController {
  final RxList<Meta> metas = <Meta>[].obs;

  late Box<Meta> _box;

  @override
  void onInit() {
    super.onInit();
    _abrirBox();
  }

  void _abrirBox() {
    _box = Hive.box<Meta>('metas');
    _carregarMetas();
  }

  void _carregarMetas() {
    metas.value =
        _box.values.where((meta) => !meta.isSemanal).toList();
  }

  void adicionarMeta(Meta meta) {
    _box.add(meta);
    _carregarMetas();
  }

  void atualizar() {
    _carregarMetas();
  }
}