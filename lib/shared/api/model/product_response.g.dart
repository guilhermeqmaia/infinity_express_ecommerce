// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) =>
    ProductResponse(
      json['id'] as int,
      json['title'] as String,
      json['description'] as String,
      (json['discountPercentage'] as num).toDouble(),
      Decimal.parse(json['price'].toString()),
      (json['rating'] as num).toDouble(),
      json['brand'] as String,
      json['category'] as String,
      json['thumbnail'] as String,
      (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ProductResponseToJson(ProductResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'discountPercentage': instance.discountPercentage,
      'price': instance.price,
      'rating': instance.rating,
      'brand': instance.brand,
      'category': instance.category,
      'thumbnail': instance.thumbnail,
      'images': instance.images,
    };
