import 'package:final_project/Core/widgets/back_arrwo.dart';
import 'package:final_project/Core/widgets/custom_button.dart';
import 'package:final_project/features/Cart/controller/Cart_provider.dart';
import 'package:final_project/features/Home/view/home_screen.dart';
import 'package:final_project/features/Orders/controller/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});
  static String route = "/Cart-Screen";

  @override
  Widget build(BuildContext context,ref) {
    final cartItems = ref.watch(cartItemsProvider);
    final total = cartItems.fold<double>(
      0,
      (sum, item) => sum + (item.price * item.quantity),
    );

    if (cartItems.isEmpty) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: BackArrow(onPressed: () => Navigator.pop(context)),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/parcel 1.png'),
              const Text(
                'Your Cart is Empty',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              CustomButton(
                title: 'Explore Products',
                onPressed: () => Navigator.pushReplacementNamed(context, HomeScreen.route),
                width: 170,
              ),
            ],
          ),
        ),
      );
    }

else{  
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackArrow(onPressed: () => Navigator.pop(context)),
        title: const Text("Your Cart"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return  ListTile(
  leading: Image.network(item.image, width: 50, height: 50),
  title: Text(item.name),
  subtitle: Row(
    children: [
      IconButton(
        icon: const Icon(Icons.remove_circle_outline),
        onPressed: () {
           ref.read(cartItemsProvider.notifier).decrease(item.id.toString());
        },
      ),
      Text('${item.quantity}', style: const TextStyle(fontSize: 16)),
      IconButton(
        icon: const Icon(Icons.add_circle_outline),
        onPressed: () {
   ref.read(cartItemsProvider.notifier).increase(item.id.toString());
        },
      ),
    ],
  ),
  trailing: Text("\$${(item.price * item.quantity).toStringAsFixed(2)}"),
);

                },
              ),
            ),
            const SizedBox(height: 16),
            Text("Total: \$${total.toStringAsFixed(2)}",
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            CustomButton(
              title: 'Checkout',
              onPressed: () {
                ref.read(cartItemsProvider.notifier).checkout();
ref.read(ordersProvider.notifier).reloadOrders(); 
                ref.read(cartItemsProvider.notifier).clear();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Order placed successfully!")),
                );
              },
            ),
          ],
        ),
      ),
    );
  }}
}
