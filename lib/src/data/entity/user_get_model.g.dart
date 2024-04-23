// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_get_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserGetDataAdapter extends TypeAdapter<UserGetData> {
  @override
  final int typeId = 2;

  @override
  UserGetData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserGetData(
      is_active: fields[5] as bool,
      id: fields[0] as int,
      firstName: fields[1] as String,
      phoneNumber: fields[2] as String,
      type: fields[3] as String,
      market: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserGetData obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.firstName)
      ..writeByte(2)
      ..write(obj.phoneNumber)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.market)
      ..writeByte(5)
      ..write(obj.is_active);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserGetDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
