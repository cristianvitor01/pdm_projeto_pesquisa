import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:pdm_projeto_pesquisa/models/meta.dart';

class MetasController extends GetxController {
  final RxList<Meta> metas = <Meta>[].obs;
  late Box<Meta> _box;

  @override
  void onInit() {
    super.onInit();
    _box = Hive.box<Meta>('metas');
    carregarMetas();
  }

  void carregarMetas() {
    metas.value = _box.values
        .where((meta) => !meta.isSemanal)
        .toList();
  }

  void adicionarMeta(Meta meta) {
    _box.add(meta);
    carregarMetas();
  }

  void removerMeta(Meta meta) {
    final index = metas.indexOf(meta);
    if (index == -1) return;

    meta.delete();
    metas.removeAt(index);
  }


  void contabilizarTempo(String nomeDaMeta, int segundos) {
    try {
      final index = metas.indexWhere((m) => m.nome == nomeDaMeta);

      if (index != -1) {
        var meta = metas[index];

        meta.segundosCumpridos += segundos;
        
        meta.save();
        
        metas.refresh();
        print("Tempo adicionado: $segundos segundos na meta ${meta.nome}");
      }
    } catch (e) {
      print("Erro ao contabilizar tempo: $e");
    }
  }
}