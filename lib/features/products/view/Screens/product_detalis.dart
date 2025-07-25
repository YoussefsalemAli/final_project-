import 'package:final_project/Core/Colors/all_colors.dart';
import 'package:final_project/Core/widgets/back_arrwo.dart';
import 'package:final_project/Core/widgets/custom_button.dart';
import 'package:final_project/features/Cart/controller/Cart_provider.dart';
import 'package:final_project/features/Cart/models/cart_item_model.dart';
import 'package:final_project/features/products/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductDetailsScreen extends ConsumerStatefulWidget {
  final ProductModel product;
  static String route = "/Product_Details";

  const ProductDetailsScreen({super.key, required this.product});

  @override
  ConsumerState<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}
class _ProductDetailsScreenState extends ConsumerState<ProductDetailsScreen> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {

    final product = widget.product;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackArrow(onPressed: () => Navigator.pop(context)),
        title: Text(product.name),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(product.image),
                const SizedBox(height: 16),
                Text(product.name,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text("\$${product.price}",
                    style: const TextStyle(fontSize: 18, color: Colors.purple)),
                const SizedBox(height: 16),
                Text('Rate : ${product.rate}', style: const TextStyle(fontSize: 20)),
                const SizedBox(height: 8),
                Text(product.description),
                const SizedBox(height: 16),
          
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Quantity:", style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold)),
                      const SizedBox(width: 10),
                      IconButton(color:primaryColor,
                        onPressed: () {
                          if (quantity > 1) {
                            setState(() => quantity--);
                          }
                        },
                        icon: Image.asset('assets/minus.png',color: Colors.black,),
                      ),
                      Text(quantity.toString(), style: const TextStyle(fontSize: 18)),
                      IconButton(color:primaryColor,
                        onPressed: () {
                          setState(() => quantity++);
                        },
                        icon: Image.asset('assets/add.png',color: Colors.black,),
                      ),
                    ],
                  ),
                ),
          
                const SizedBox(height: 16),
CustomButton(
  title: 'Add $quantity to Cart',
  onPressed: () {
    final item = CartItemRealmModel(
       DateTime.now().millisecondsSinceEpoch.toString(), // أو ObjectId().toString()
       widget.product.id.toString(),
     widget.product.name,
       widget.product.image,
       widget.product.price,
      quantity,
    );

    ref.read(cartItemsProvider.notifier).addToCart(item);

    
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Product added to your cart!")),
    );
  },
)

              ],
            ),
          ),
        ),
      ),
    );
  }
}
