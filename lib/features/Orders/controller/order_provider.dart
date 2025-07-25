import 'package:final_project/features/Cart/controller/Cart_provider.dart';
import 'package:final_project/features/Cart/repository/cart_repository.dart';

import 'package:final_project/features/Orders/models/order_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ordersProvider =  
    StateNotifierProvider<OrdersNotifier, List<OrderItemRealmModel>>((ref) {
  final repo = ref.watch(cartRepositoryProvider);
  return OrdersNotifier(repo);
});

class OrdersNotifier extends StateNotifier<List<OrderItemRealmModel>> {
  final CartRepository repo;

  OrdersNotifier(this.repo) : super(repo.getOrders());

  void reloadOrders() {
    state = repo.getOrders();
    print("📦 Orders reloaded: ${state.length}");
  }
}