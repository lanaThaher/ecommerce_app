// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_detailes_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PaymentDetailesModelAdapter extends TypeAdapter<PaymentDetailesModel> {
  @override
  final int typeId = 3;

  @override
  PaymentDetailesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PaymentDetailesModel(
      discount: fields[3] as double,
      total: fields[0] as double,
      subTotal: fields[1] as double,
      deliveryCost: fields[2] as double,
    );
  }

  @override
  void write(BinaryWriter writer, PaymentDetailesModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.total)
      ..writeByte(1)
      ..write(obj.subTotal)
      ..writeByte(2)
      ..write(obj.deliveryCost)
      ..writeByte(3)
      ..write(obj.discount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PaymentDetailesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
