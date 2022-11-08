import 'package:decimal/decimal.dart';
import 'package:e_commerce_app/features/products/model/product_model.dart';
import 'package:faker/faker.dart';

class FakeRepository {
  static Future<List<ProductModel>> fetchProducts() async {
    return [
      ProductModel(
        id: faker.randomGenerator.integer(10),
        title: faker.lorem.word(),
        description: faker.lorem.sentence(),
        discountPercentage: faker.randomGenerator.decimal(),
        price: Decimal.parse(faker.randomGenerator.integer(5).toString()),
        rating: faker.randomGenerator.decimal(scale: 5),
        brand: faker.lorem.word(),
        category: faker.lorem.word(),
        thumbnail: faker.image.image(),
        images: [
          faker.image.image(),
          faker.image.image(),
        ],
      ),
    ];
  }
}
