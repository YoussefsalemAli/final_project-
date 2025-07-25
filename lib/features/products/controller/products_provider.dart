import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:final_project/features/products/models/product_model.dart';
import 'package:final_project/features/products/repository/product_repository.dart';


final homeProductsProvider = StateNotifierProvider<HomeProductsNotifier, AsyncValue<List<ProductModel>>>((ref) {
    final repo = ref.watch(productRepositoryProvider);
    return HomeProductsNotifier(repo);
  },
);


class HomeProductsNotifier extends StateNotifier<AsyncValue<List<ProductModel>>> {
  final ProductRepository repository;

  HomeProductsNotifier(this.repository) : super(const AsyncLoading()) {
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      final products = await repository.fetchProducts();
      state = AsyncData(products);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}

final productSearchQueryProvider = StateProvider<String>((ref) => '');

final filteredProductsProvider = Provider<List<ProductModel>>((ref) {
  final query = ref.watch(productSearchQueryProvider).toLowerCase();
  final state = ref.watch(homeProductsProvider);

  return state.when(
    data: (products) {
      if (query.isEmpty) return products;
      return products
          .where((product) =>
              product.name.toLowerCase().contains(query))
          .toList();
    },
    loading: () => [],
    error: (_, __) => [],
  );
});
