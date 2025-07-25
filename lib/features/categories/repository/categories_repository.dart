import 'package:dio/dio.dart';
import 'package:final_project/features/categories/models/categories_model.dart';

class CategoriesRepository {
  final Dio dio;

  CategoriesRepository({required this.dio}); // ✅ إضافة الكونستركتر

  Future<List<CategoryWithImage>> getCategoriesWithImages() async {
    const allowedCategories = [
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

    final List<CategoryWithImage> result = [];

    for (final category in allowedCategories) {
      try {
        final productRes = await dio.get('https://dummyjson.com/products/category/$category');
        final product = productRes.data['products'][0];
        result.add(CategoryWithImage(
          name: category,
          imageUrl: product['thumbnail'],
        ));
      } catch (error) {
        print(error);
        continue; // skip if error
      }
    }

    return result;
  }
}
