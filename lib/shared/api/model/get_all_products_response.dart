import 'product_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_all_products_response.g.dart';

@JsonSerializable()
class GetAllProductsResponse {
  List<ProductResponse> products;
  GetAllProductsResponse(this.products);

  factory GetAllProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllProductsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetAllProductsResponseToJson(this);
}
