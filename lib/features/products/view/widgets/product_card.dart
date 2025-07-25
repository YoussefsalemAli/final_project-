import 'package:final_project/Core/Colors/all_colors.dart';
import 'package:final_project/features/favorite/controller/favorite_provider.dart';
import 'package:final_project/features/favorite/models/favorite_model.dart';
import 'package:final_project/features/products/models/product_model.dart';
import 'package:final_project/features/products/view/Screens/product_detalis.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductCard extends ConsumerWidget  {
  final ProductModel product;
  const ProductCard({
    super.key,
    required this.product,
  });



  @override
    Widget build(BuildContext context, WidgetRef ref) {
final favorites = ref.watch(favoriteProductsProvider);
final isFav = favorites.any((fav) => fav.id == product.id);
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: const [
              BoxShadow(color: Colors.black12, blurRadius: 5),
            ],
          ),
          child: Column(
            children: [
              GestureDetector(
                  onTap: () {
                  Navigator.push(
              context,
              MaterialPageRoute(
              builder: (_) => ProductDetailsScreen(product:product),
              ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ClipRRect(
                    
                      borderRadius:  BorderRadius.vertical(top: Radius.circular(12)),
                      child: Image.network(
                        product.image,
                        height: 168,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.all(8.0),
                      child: Text(
                        product.name,
                        style:  TextStyle(fontWeight: FontWeight.bold),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        '\$${product.price}',
                        style:  TextStyle(color:primaryColor),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        '\Rate : ${product.rate}🔥',
                        style:  TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              
            ],
          ),
        ),
         Positioned(
      top: 8,
      right: 8,
      child: 
IconButton(
  icon: Icon(
    isFav ? Icons.favorite : Icons.favorite_border,
    color: isFav ? Colors.red : Colors.grey,
  ),
  onPressed: () {
    ref.read(favoriteProductsProvider.notifier).toggle(
      FavoriteProduct(
       product.id,
        name: product.name,
        image: product.image,
        price: product.price,
        rate: product.rate,
      ),
    );
  },
),

    ),
      ],
    );
  }
}
