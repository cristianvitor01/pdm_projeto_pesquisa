import 'package:hive/hive.dart';

part 'check_in_model.g.dart';

@HiveType(typeId: 1)
class CheckInModel extends HiveObject {
  @HiveField(0)
  String nome;

  @HiveField(1)
  String metaRelacionada;

  @HiveField(2)
  String localizacao;

  @HiveField(3)
  DateTime data;

  CheckInModel({
    required this.nome,
    required this.metaRelacionada,
    required this.localizacao,
    required this.data,
  });
}