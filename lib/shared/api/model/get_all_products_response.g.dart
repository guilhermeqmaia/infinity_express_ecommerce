// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_products_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllProductsResponse _$GetAllProductsResponseFromJson(
        Map<String, dynamic> json) =>
    GetAllProductsResponse((json['products'] as List<dynamic>)
        .map((e) => ProductResponse.fromJson(e as Map<String, dynamic>))
        .toList());

Map<String, dynamic> _$GetAllProductsResponseToJson(
        GetAllProductsResponse instance) =>
    <String, dynamic>{
      'products': instance.products,
    };
