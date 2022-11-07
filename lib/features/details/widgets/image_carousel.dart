import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../products/model/product_model.dart';

class ImageCarousel extends StatelessWidget {
  const ImageCarousel({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.brown,
          ),
        ),
      ),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 300,
          autoPlay: false,
        ),
        items: product.images.map(
          (e) {
            return Builder(
              builder: (context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.all(5),
                  child: AspectRatio(
                    aspectRatio: 20 / 10,
                    child: Image.network(e),
                  ),
                );
              },
            );
          },
        ).toList(),
      ),
    );
  }
}
