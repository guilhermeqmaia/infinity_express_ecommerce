import '../../../shared/api/model/get_all_products_response.dart';
import '../model/product_model.dart';

extension ProductsMapper on GetAllProductsResponse {
  List<ProductModel> toViewData() {
    return products.map((product) {
      return ProductModel(
        id: product.id,
        title: product.title,
        description: product.description,
        discountPercentage: product.discountPercentage,
        price: product.price,
        rating: product.rating,
        brand: product.brand,
        category: product.category,
        thumbnail: product.thumbnail,
        images: product.images,
      );
    }).toList();
  }
}
