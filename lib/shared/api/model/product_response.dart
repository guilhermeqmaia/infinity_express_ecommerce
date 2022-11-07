import 'package:decimal/decimal.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_response.g.dart';

@JsonSerializable()
class ProductResponse {
  int id;
  String title;
  String description;
  double discountPercentage;
  Decimal price;
  double rating;
  String brand;
  String category;
  String thumbnail;
  List<String> images;
  ProductResponse(
    this.id,
    this.title,
    this.description,
    this.discountPercentage,
    this.price,
    this.rating,
    this.brand,
    this.category,
    this.thumbnail,
    this.images,
  );

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
}
