import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop/data/dummy_data.dart';
import 'package:shop/models/product.dart';

class ProductList with ChangeNotifier {
  final List<Product> _items = dummy_products;

  List<Product> get items => [..._items];
  List<Product> get favoriteItems =>
      _items.where((product) => product.isFavorite).toList();

  int get itemsCount {
    return _items.length;
  }

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }

  void saveProduct(Map<String, Object> formData) {
    bool hasId = formData['Id'] != null;

    final newProduct = Product(
      id: hasId ? formData['id'] as String : Random().nextDouble().toString(),
      name: formData['name'] as String,
      description: formData['description'] as String,
      price: formData['price'] as double,
      imageUrl: formData['urlImage'] as String,
    );

    if (hasId) {
      updateProduct(newProduct);
    } else {
      addProduct(newProduct);
    }
  }

  void updateProduct(Product product) {
    int index = _items.indexWhere((produto) => produto.id == product.id);

    if (index >= 0) {
      _items[index] = product;
      notifyListeners();
    }
  }

  void removeItem(String id) {
    _items.removeWhere((product) => product.id == id);
    notifyListeners();
  }
}


// List<Product> get items {
//     if (_showFavoriteOnly) {
//       return _items.where((product) => product.isFavorite).toList();
//     }
//     return [..._items];
//   }

//   bool _showFavoriteOnly = false;

//   void showFavoriteOnly() {
//     _showFavoriteOnly = true;
//     notifyListeners();
//   }

//   void showAll() {
//     _showFavoriteOnly = false;
//     notifyListeners();
//   }