import 'dart:math';
import 'package:dio/dio.dart';
import 'package:final_project/core/network/dio_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product_model.dart';

class ProductRepository {
  final Dio dio;

  ProductRepository(this.dio);

  Future<List<ProductModel>> fetchProducts() async {
final clothingCategories = [
  "mens-shirts",
  "mens-shoes",
  "mens-watches",
  "tops",
  "womens-dresses",
  "womens-shoes",
  "womens-bags",
  "womens-watches",
  "womens-jewellery",
  "sunglasses",
];
    List<ProductModel> allProducts = [];

    for (final category in clothingCategories) {
      final response = await dio.get('https://dummyjson.com/products/category/$category');
      final data = response.data['products'] as List;

      final products = data.map((json) => ProductModel.fromJson(json)).toList();

      allProducts.addAll(products);
      allProducts.shuffle(Random());

    }
return allProducts;
  }
}

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return ProductRepository(dio);
});