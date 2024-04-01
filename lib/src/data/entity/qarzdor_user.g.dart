// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qarzdor_user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserDeptorsAdapter extends TypeAdapter<UserDeptors> {
  @override
  final int typeId = 1;

  @override
  UserDeptors read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserDeptors(
      ismFamilya: fields[0] as String,
      phoneNumber: fields[1] as String,
      qoshimcha: fields[2] as String,
      berishmuddati: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserDeptors obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.ismFamilya)
      ..writeByte(1)
      ..write(obj.phoneNumber)
      ..writeByte(2)
      ..write(obj.qoshimcha)
      ..writeByte(3)
      ..write(obj.berishmuddati);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserDeptorsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
