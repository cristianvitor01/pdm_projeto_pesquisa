import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:pdm_projeto_pesquisa/models/check_in_model.dart';
import 'package:pdm_projeto_pesquisa/controllers/metas_controller.dart';

class CheckInController extends GetxController {
  var checkIns = <CheckInModel>[].obs;
  late Box<CheckInModel> box;

  final int intervaloVerificacao = 30; 
  final int toleranciaSemConfirmacao = 10; 
  final int avisoAntecedencia = 15;

  var tempoFormatado = "00:00:00".obs;
  
  int _segundosAcumulados = 0;
  
  DateTime? _ultimaConfirmacao;
  
  Timer? _timerGlobal;

  final RxBool precisaConfirmarPresenca = false.obs;
  final RxBool cronometroPausado = false.obs;

  @override
  void onInit() {
    super.onInit();
    box = Hive.box<CheckInModel>('checkins');
    carregarCheckIns();
  }

  void carregarCheckIns() {
    checkIns.assignAll(box.values.toList());

    if (checkIns.isNotEmpty) {
      iniciarCicloDeAtividade();
    }
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

    iniciarCicloDeAtividade();
  }

  void iniciarCicloDeAtividade() {
    _timerGlobal?.cancel();
    _segundosAcumulados = 0; 
    _ultimaConfirmacao = DateTime.now();
    precisaConfirmarPresenca.value = false;
    cronometroPausado.value = false;

    _timerGlobal = Timer.periodic(const Duration(seconds: 1), (timer) {
      _processarLogicaSegundo();
    });
  }

  void _processarLogicaSegundo() {
    if (cronometroPausado.value) return;

    _segundosAcumulados++;
    _atualizarTempoFormatado();

    if (_ultimaConfirmacao == null) return;
    final segundosDesdeUltimaValidacao = DateTime.now().difference(_ultimaConfirmacao!).inSeconds;

    if (segundosDesdeUltimaValidacao == (intervaloVerificacao - avisoAntecedencia)) {
      Get.snackbar(
        "Atenção",
        "Validação de presença necessária em $avisoAntecedencia segundos.",
        backgroundColor: Colors.orangeAccent,
        colorText: Colors.white,
        duration: const Duration(seconds: 4),
      );
    }

    if (segundosDesdeUltimaValidacao == intervaloVerificacao) {
      precisaConfirmarPresenca.value = true;
      Get.snackbar(
        "Confirmação Necessária",
        "Confirme sua localização para continuar pontuando.",
        backgroundColor: Colors.amber,
        colorText: Colors.black,
        isDismissible: false,
        duration: const Duration(seconds: 10),
      );
    }

    if (segundosDesdeUltimaValidacao >= (intervaloVerificacao + toleranciaSemConfirmacao)) {
      _pausarAtividadePorInatividade();
    }
  }

  void _pausarAtividadePorInatividade() {
    cronometroPausado.value = true;
    
    Get.snackbar(
      "Atividade Pausada",
      "O tempo parou de contar pois você não confirmou presença por 2 minutos.",
      backgroundColor: Colors.red,
      colorText: Colors.white,
      duration: const Duration(seconds: 10),
      icon: const Icon(Icons.timer_off, color: Colors.white),
    );
  }

  void confirmarPresencaUsuario() {
    precisaConfirmarPresenca.value = false;
    cronometroPausado.value = false;
    _ultimaConfirmacao = DateTime.now();
    
    Get.snackbar(
      "Confirmado",
      "Presença validada. O tempo continua contando!",
      backgroundColor: Colors.green.withOpacity(0.5),
      colorText: Colors.white,
    );
  }

  void _atualizarTempoFormatado() {
    final duration = Duration(seconds: _segundosAcumulados);
    final horas = duration.inHours.toString().padLeft(2, '0');
    final minutos = (duration.inMinutes % 60).toString().padLeft(2, '0');
    final segundos = (duration.inSeconds % 60).toString().padLeft(2, '0');
    tempoFormatado.value = "$horas:$minutos:$segundos";
  }

  void finalizarAtividadeEContabilizar() {
    if (checkIns.isEmpty) return;

    final checkInAtual = checkIns.last;

    if (Get.isRegistered<MetasController>()) {
      Get.find<MetasController>().contabilizarTempo(
        checkInAtual.metaRelacionada, 
        _segundosAcumulados
      );
    } else {
      print("MetasController não encontrado para salvar o tempo.");
    }

    removerUltimoCheckIn();
  }

  void removerUltimoCheckIn() {
    if (checkIns.isEmpty) return;
    box.deleteAt(box.length - 1);
    checkIns.removeLast();
    
    _timerGlobal?.cancel();
    tempoFormatado.value = "00:00:00";
    _segundosAcumulados = 0;
    precisaConfirmarPresenca.value = false;
  }

  CheckInModel? get ultimoCheckIn {
    if (checkIns.isEmpty) return null;
    return checkIns.last;
  }
  
  @override
  void onClose() {
    _timerGlobal?.cancel();
    super.onClose();
  }
}