// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MetaAdapter extends TypeAdapter<Meta> {
  @override
  final int typeId = 0;

  @override
  Meta read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Meta(
      nome: fields[0] as String,
      projeto: fields[1] as String,
      periodo: fields[2] as String,
      descricao: fields[3] as String,
      resultadosEsperados: fields[4] as String,
      cargaHoraria: fields[6] as String,
      isSemanal: fields[5] as bool,
      segundosCumpridos: fields[7] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Meta obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.nome)
      ..writeByte(1)
      ..write(obj.projeto)
      ..writeByte(2)
      ..write(obj.periodo)
      ..writeByte(3)
      ..write(obj.descricao)
      ..writeByte(4)
      ..write(obj.resultadosEsperados)
      ..writeByte(5)
      ..write(obj.isSemanal)
      ..writeByte(6)
      ..write(obj.cargaHoraria)
      ..writeByte(7)
      ..write(obj.segundosCumpridos);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MetaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
