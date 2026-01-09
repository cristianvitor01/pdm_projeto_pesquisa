import 'dart:async';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:pdm_projeto_pesquisa/models/check_in_model.dart';

class CheckInController extends GetxController {
  var checkIns = <CheckInModel>[].obs;
  late Box<CheckInModel> box;

  var tempoFormatado = "00:00:00".obs;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    box = Hive.box<CheckInModel>('checkins');
    carregarCheckIns();
  }

  void carregarCheckIns() {
    checkIns.assignAll(box.values.toList());
  }

  void adicionarCheckIn(String nome, String meta, String local) {
    final novoCheckIn = CheckInModel(
      nome: nome,
      metaRelacionada: meta,
      localizacao: local,
      data: DateTime.now(),
    );

    box.add(novoCheckIn);
    checkIns.add(novoCheckIn);

    iniciarCronometro(novoCheckIn.data);
  }

  void iniciarCronometro(DateTime inicio) {
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      final duracao = DateTime.now().difference(inicio);

      final horas = duracao.inHours.toString().padLeft(2, '0');
      final minutos = (duracao.inMinutes % 60).toString().padLeft(2, '0');
      final segundos = (duracao.inSeconds % 60).toString().padLeft(2, '0');

      tempoFormatado.value = "$horas:$minutos:$segundos";
    });
  }

  void pararCronometro() {
    _timer?.cancel();
  }

  void removerUltimoCheckIn() {
    if (checkIns.isEmpty) return;

    box.deleteAt(box.length - 1);
    checkIns.removeLast();
    pararCronometro();
  }

  CheckInModel? get ultimoCheckIn {
    if (checkIns.isEmpty) return null;
    return checkIns.last;
  }
}
