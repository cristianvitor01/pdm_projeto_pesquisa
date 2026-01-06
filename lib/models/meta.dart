import 'package:hive/hive.dart';

part 'meta.g.dart';

@HiveType(typeId: 0)
class Meta extends HiveObject {
  @HiveField(0)
  String nome;

  @HiveField(1)
  String projeto;

  @HiveField(2)
  String periodo;

  @HiveField(3)
  String descricao;

  @HiveField(4)
  String resultadosEsperados;

  @HiveField(5)
  bool isSemanal;

  @HiveField(6)
  String cargaHoraria;

  Meta({
    required this.nome,
    required this.projeto,
    required this.periodo,
    required this.descricao,
    required this.resultadosEsperados,
    required this.cargaHoraria,
    this.isSemanal = false,
  });
}