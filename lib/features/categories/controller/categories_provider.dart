import 'package:final_project/features/categories/models/categories_model.dart';
import 'package:final_project/features/categories/repository/categories_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';

final dioProvider = Provider((ref) => Dio());

final categoriesRepositoryProvider = Provider((ref) {
  final dio = ref.watch(dioProvider);
  return CategoriesRepository(dio: dio);
});

final categoriesProvider = FutureProvider<List<CategoryWithImage>>((ref) {
  final repo = ref.watch(categoriesRepositoryProvider);
  return repo.getCategoriesWithImages();
});
