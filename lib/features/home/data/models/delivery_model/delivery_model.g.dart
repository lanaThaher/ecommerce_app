// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DeliveryModelAdapter extends TypeAdapter<DeliveryModel> {
  @override
  final int typeId = 4;

  @override
  DeliveryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DeliveryModel(
      address: fields[0] as String,
      street: fields[1] as String,
      building: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, DeliveryModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.address)
      ..writeByte(1)
      ..write(obj.street)
      ..writeByte(2)
      ..write(obj.building);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeliveryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
