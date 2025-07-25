import 'package:final_project/features/favorite/controller/Converter_to_ProductModel.dart';
import 'package:final_project/features/products/view/Screens/product_detalis.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:final_project/features/favorite/controller/favorite_provider.dart';

class FavoriteTab extends ConsumerWidget {
  const FavoriteTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
   final favorites = ref.watch(favoriteProductsProvider).where((fav) => fav.isValid).toList();

    if (favorites.isEmpty) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/bell 1.png'),
              const SizedBox(height: 16),
              const Text(
                'No Favorites yet',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(

        itemCount: favorites.length,
        itemBuilder: (context, index) {
     final fav = favorites[index];
if (!fav.isValid) return const SizedBox();
          return GestureDetector(
                              onTap: () {
                  Navigator.push(
              context,
              MaterialPageRoute(
          builder: (_) => ProductDetailsScreen(product: fav.toProductModel()),
              ),
                  );
                },
            child: ListTile(
              leading: Image.network(fav.image ?? '', width: 50, height: 50, fit: BoxFit.cover),
              title: Text(fav.name ?? ''),
              subtitle: Text('\$${fav.price?.toStringAsFixed(2)}'),
              trailing: IconButton(
                icon: const Icon(Icons.heart_broken, color: Colors.red),
                onPressed: () {
                  ref.read(favoriteProductsProvider.notifier).toggle(fav);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
