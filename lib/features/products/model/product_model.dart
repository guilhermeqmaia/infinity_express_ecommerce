import 'package:decimal/decimal.dart';

class ProductModel {
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
  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.discountPercentage,
    required this.price,
    required this.rating,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });
}
