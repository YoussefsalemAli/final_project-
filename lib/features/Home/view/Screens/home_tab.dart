import 'package:final_project/features/products/controller/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:final_project/features/categories/view/widgets/categories_row_list.dart';
import 'package:final_project/features/Home/view/widgets/custom_search_text_field.dart';
import 'package:final_project/features/products/view/widgets/product_card.dart';
import 'package:final_project/features/Home/view/widgets/see_all_row.dart';
import 'package:final_project/features/Home/view/widgets/top_row.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final TextEditingController _searchController= TextEditingController();
class HomeTab extends ConsumerWidget {
  static String route = "/Home_Tab";
  const HomeTab({super.key});
  @override
Widget build(BuildContext context, WidgetRef ref) {
  final productsState = ref.watch(homeProductsProvider); // للتحميل أو الخطأ
  final filteredProducts = ref.watch(filteredProductsProvider); // قائمة المنتجات المفلترة

  return productsState.when(
    loading: () => const Center(child: CircularProgressIndicator()),
    error: (err, stack) => Center(child: Text("حدث خطأ: $err")),
    data: (_) => SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopRow(),
              CustomSearchTextfield(searchController: _searchController),
              const SizedBox(height: 5),
              RowSeeAll(title: "Categories : "),
              const SizedBox(height: 5),
              CategoriesRowList(),
              const SizedBox(height: 5),
              RowSeeAll(title: "Products : "),
              const SizedBox(height: 5),
              filteredProducts.isEmpty
                  ? const Center(
                      child: Text(
                        'Oops! We couldn’t find any products matching your search.👀',
                        style: TextStyle(fontSize: 25, color: Colors.black),
                        maxLines: 2,
                      ),
                    )
                  : GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: filteredProducts.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.7,
                      ),
                      itemBuilder: (context, index) {
                        return ProductCard(product: filteredProducts[index]);
                      },
                    ),
            ],
          ),
        ),
      ),
    ),
  );
}
}