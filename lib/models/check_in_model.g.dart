// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_in_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CheckInModelAdapter extends TypeAdapter<CheckInModel> {
  @override
  final int typeId = 1;

  @override
  CheckInModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CheckInModel(
      nome: fields[0] as String,
      metaRelacionada: fields[1] as String,
      localizacao: fields[2] as String,
      data: fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, CheckInModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.nome)
      ..writeByte(1)
      ..write(obj.metaRelacionada)
      ..writeByte(2)
      ..write(obj.localizacao)
      ..writeByte(3)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CheckInModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
