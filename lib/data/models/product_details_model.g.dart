// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductDetailsModelAdapter extends TypeAdapter<ProductDetailsModel> {
  @override
  final int typeId = 2;

  @override
  ProductDetailsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductDetailsModel(
      rating: fields[6] as double?,
      id: fields[0] as int,
      isLiked: fields[5] as bool,
      price: fields[3] as int,
      title: fields[1] as String,
      description: fields[2] as String,
      reviewCount: fields[4] as int?,
      images: (fields[7] as List).cast<ProductDetailImagesModel>(),
      sizes: (fields[8] as List).cast<SizeModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, ProductDetailsModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.reviewCount)
      ..writeByte(5)
      ..write(obj.isLiked)
      ..writeByte(6)
      ..write(obj.rating)
      ..writeByte(7)
      ..write(obj.images)
      ..writeByte(8)
      ..write(obj.sizes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductDetailsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
