import 'package:flutter/foundation.dart';
import '../models/product_model.dart';

class ShopProvider with ChangeNotifier {
  List<ProductModel> _products = [
    ProductModel(
      id: 'p1',
      name: 'Nike Air Max',
      description: 'Sepatu lari nyaman dengan teknologi Air Max.',
      price: 1200000,
      imageUrl: 'assets/images/nike.png',
      category: 'Sport',
    ),
    ProductModel(
      id: 'p2',
      name: 'Adidas Ultraboost',
      description: 'Sepatu running dengan bantalan empuk.',
      price: 1500000,
      imageUrl: 'assets/images/adidas.png',
      category: 'Sport',
    ),
    ProductModel(
      id: 'p3',
      name: 'Converse Chuck Taylor',
      description: 'Sneaker klasik yang cocok untuk santai.',
      price: 500000,
      imageUrl: 'assets/images/converse.png',
      category: 'Casual',
    ),
    ProductModel(
      id: 'p4',
      name: 'Vans Old Skool',
      description: 'Sneaker ikonik dengan stripe khas Vans.',
      price: 600000,
      imageUrl: 'assets/images/vans.png',
      category: 'Sneakers',
    ),
    ProductModel(
      id: 'p5',
      name: 'Puma RS-X',
      description: 'Desain retro futuristik dari Puma.',
      price: 1100000,
      imageUrl: 'assets/images/puma.png',
      category: 'Sneakers',
    ),
    ProductModel(
      id: 'p6',
      name: 'New Balance 574',
      description: 'Sepatu klasik dengan kenyamanan sepanjang hari.',
      price: 900000,
      imageUrl: 'assets/images/new.png',
      category: 'Casual',
    ),
    ProductModel(
      id: 'p7',
      name: 'Legacy Oxford',
      description: 'Sepatu formal untuk acara penting.',
      price: 1000000,
      imageUrl: 'assets/images/oxford.png',
      category: 'Formal',
    ),
    ProductModel(
      id: 'p8',
      name: 'Marelli High Heels',
      description: 'Sepatu formal untuk acara penting.',
      price: 1000000,
      imageUrl: 'assets/images/marelli.png',
      category: 'Formal',
    ),
  ];

  List<ProductModel> get products {
    return [..._products];
  }

  List<ProductModel> getProductsByCategory(String category) {
    if (category == 'All') {
      return [..._products];
    }
    return _products.where((product) => product.category == category).toList();
  }

  ProductModel? getProductById(String id) {
    try {
      return _products.firstWhere((product) => product.id == id);
    } catch (e) {
      if (e is StateError) {
        return null;
      }
      rethrow;
    }
  }
}
