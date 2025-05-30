// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_history_model.dart';

class SearchHistoryModelAdapter extends TypeAdapter<SearchHistoryModel> {
  @override
  final int typeId = 5;

  @override
  SearchHistoryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SearchHistoryModel(
      title: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SearchHistoryModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchHistoryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
