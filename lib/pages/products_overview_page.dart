import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/product_item.dart';
import 'package:shop/data/dummy_data.dart';
import 'package:shop/models/product.dart';
import 'package:shop/models/product_list.dart';

import '../components/product_grid.dart';

enum FilterOptions {
  Favorite,
  All,
}

class ProductsOverViewPage extends StatelessWidget {
  ProductsOverViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Shop'),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => [
              const PopupMenuItem(
                child: Text('Somente Favoritos'),
                value: FilterOptions.Favorite,
              ),
              const PopupMenuItem(
                child: Text('Todos '),
                value: FilterOptions.All,
              ),
            ],
            onSelected: (FilterOptions selectedValue) => {
              if (selectedValue == FilterOptions.Favorite)
                provider.showFavoriteOnly()
              else
                provider.showAll()
            },
          ),
        ],
      ),
      body: ProductGrid(),
    );
  }
}
