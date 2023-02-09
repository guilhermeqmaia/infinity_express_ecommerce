import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'products_provider.dart';
import 'widgets/products_list_view.dart';

import 'model/product_model.dart';

class ProductsPage extends ConsumerStatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends ConsumerState<ProductsPage> {
  int index = 0;

  List<String> categories = ['All'];

  void updateCategories(List<ProductModel> products) {
    for (ProductModel product in products) {
      if (!categories.contains(product.category)) {
        categories.add(product.category);
      }
    }
  }

  void updateCategory(int value) {
    setState(() {
      index = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final products = ref.watch(productsProvider);
    return products.when(
      data: (data) {
        updateCategories(data);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: const _ProductsAppBar(),
          body: Column(
            children: [
              SizedBox(
                height: 60,
                child: ListView(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  scrollDirection: Axis.horizontal,
                  children: categories.map(
                    (item) {
                      return GestureDetector(
                        onTap: () {
                          updateCategory(categories
                              .indexWhere((element) => element == item));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: DefaultTextStyle(
                            style: TextStyle(
                              color: categories[index] == item
                                  ? Colors.brown
                                  : Colors.black54,
                              fontSize: 25,
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w600,
                            ),
                            child: Text(item.toUpperCase()),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
              Flexible(
                child: ProductsListView(
                  index: index,
                  categories: categories,
                  products: data,
                ),
              ),
            ],
          ),
        );
      },
      error: (e, s) {
        debugPrint("$e");
        debugPrint("$s");
        return const Scaffold(
          body: Center(
            child: Text('Deu erro'),
          ),
        );
      },
      loading: () => const Scaffold(
        body: Center(
          child: CupertinoActivityIndicator(
            color: Colors.brown,
          ),
        ),
      ),
    );
  }
}

class _ProductsAppBar extends StatelessWidget with PreferredSizeWidget {
  const _ProductsAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(
        'Olá Guilherme',
        style: TextStyle(
          color: Colors.brown.shade700,
          fontSize: 30,
          fontFamily: 'Nunito',
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      actions: [
        IconButton(
          onPressed: () => Navigator.pushNamed(context, '/cart'),
          icon: Icon(
            Icons.local_mall,
            color: Colors.brown.shade700,
            size: 30,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Icon(
            Icons.menu,
            color: Colors.brown.shade700,
            size: 35,
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 56);
}
