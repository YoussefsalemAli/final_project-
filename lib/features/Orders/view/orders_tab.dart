import 'package:final_project/features/Orders/controller/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrdersScreen extends ConsumerWidget {
  static String route = "/orders";

  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orders = ref.watch(ordersProvider);

    return Scaffold(
      backgroundColor: Colors.white,

      body: orders.isEmpty
          ? const Center(
              child: Text(
                "No orders yet.",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: orders.length,
              itemBuilder: (_, i) {
                final order = orders[i];
                return Card(
                  color: Colors.grey[100],
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 2,
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                    leading: const Icon(Icons.shopping_bag, color:Colors.deepPurple),
                    title: Text(
                      order.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      "Qty: ${order.quantity}  •  \$${order.price.toStringAsFixed(2)}",
                      style: const TextStyle(fontSize: 14),
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.calendar_today, size: 14, color: Colors.grey),
                        const SizedBox(height: 4),
                        Text(
                          "${order.date.day}/${order.date.month}/${order.date.year}",
                          style: const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
