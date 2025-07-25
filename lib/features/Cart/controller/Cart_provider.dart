import 'package:final_project/Config/Realm_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repository/cart_repository.dart';
import '../models/cart_item_model.dart';

final cartRepositoryProvider = Provider<CartRepository>((ref) {
  return CartRepository(realm);
});

final cartItemsProvider =
    StateNotifierProvider<CartNotifier, List<CartItemRealmModel>>((ref) {
  final repo = ref.watch(cartRepositoryProvider);
  return CartNotifier(repo);
});


class CartNotifier extends StateNotifier<List<CartItemRealmModel>> {
  final CartRepository repo;

  CartNotifier(this.repo) : super(repo.getCartItems());

  void addToCart(CartItemRealmModel item) {
    repo.addToCart(item);
    state = repo.getCartItems();
  }

  void increase(String id) {
    repo.increaseQuantity(id);
    state = repo.getCartItems();
  }

  void decrease(String id) {
    repo.decreaseQuantity(id);
    state = repo.getCartItems();
  }

  void remove(String id) {
    repo.removeFromCart(id);
    state = repo.getCartItems();
  }

  void clear() {
    repo.clearCart(); 
    state = [];
  }

  void checkout() {
    repo.checkout();
    state = [];
  }
}
