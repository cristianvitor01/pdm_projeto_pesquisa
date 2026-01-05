import 'package:hive/hive.dart';

part 'meta.g.dart';

@HiveType(typeId: 0)
class Meta {
  @HiveField(0)
  String nome;

  @HiveField(1)
  String projeto;

  @HiveField(2)
  String cargaHoraria;

  @HiveField(3)
  String periodo;

  @HiveField(4)
  String descricao;

  @HiveField(5)
  String resultadosEsperados;

  Meta({
    required this.nome,
    required this.projeto,
    required this.cargaHoraria,
    required this.periodo,
    required this.descricao,
    required this.resultadosEsperados,
  });
}