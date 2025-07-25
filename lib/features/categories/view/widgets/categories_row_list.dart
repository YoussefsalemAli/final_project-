import 'package:final_project/features/categories/view/screens/categories_products_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:final_project/features/categories/controller/categories_provider.dart';
import 'package:final_project/Core/Colors/all_colors.dart';

class CategoriesRowList extends ConsumerWidget {
  const CategoriesRowList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(categoriesProvider);

    return SizedBox(
      height: 110,
      child: categoriesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text("Error: $err")),
        data: (categories) => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryProductsScreen(categorySlug: category.name),
      ),
    );
  },
  child: Padding(
    padding: const EdgeInsets.only(right: 13.0),
    child: Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: backgorundColor,
          child: ClipOval(
            child: Image.network(
              category.imageUrl,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
category.name,
          style: const TextStyle(fontSize: 15),
        ),
      ],
    ),
  ),
);
          },
        ),
      ),
    );
  }
}
