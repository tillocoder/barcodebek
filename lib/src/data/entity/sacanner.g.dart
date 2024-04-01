// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sacanner.dart';

class ScannModelPriceAdapter extends TypeAdapter<ScannModelPrice> {
  @override
  final int typeId = 0;

  @override
  ScannModelPrice read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ScannModelPrice(
      barcode: fields[0] as String,
      price: fields[1] as String,
      name: fields[2] as String,
      dateTime: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ScannModelPrice obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.barcode)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.dateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScannModelPriceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class Scann1ModelPriceAdapter extends TypeAdapter<ScannModelPrice> {
  @override
  final int typeId = 0;

  @override
  ScannModelPrice read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ScannModelPrice(
      barcode: fields[0] as String,
      price: fields[1] as String,
      name: fields[2] as String,
      dateTime: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ScannModelPrice obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.barcode)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.dateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScannModelPriceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
