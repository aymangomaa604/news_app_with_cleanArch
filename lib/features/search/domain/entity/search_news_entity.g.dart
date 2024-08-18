// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_news_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SearchNewsEntityAdapter extends TypeAdapter<SearchNewsEntity> {
  @override
  final int typeId = 1;

  @override
  SearchNewsEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SearchNewsEntity(
      image: fields[0] as String,
      tiTle: fields[1] as String,
      subTitle: fields[2] as String,
      uRl: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SearchNewsEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.image)
      ..writeByte(1)
      ..write(obj.tiTle)
      ..writeByte(2)
      ..write(obj.subTitle)
      ..writeByte(3)
      ..write(obj.uRl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchNewsEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
