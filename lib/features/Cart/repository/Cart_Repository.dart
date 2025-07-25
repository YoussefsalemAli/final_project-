import 'package:final_project/features/Orders/models/order_model.dart';
import 'package:realm/realm.dart';
import '../models/cart_item_model.dart';

class CartRepository {
  final Realm realm;

  CartRepository(this.realm);

  List<CartItemRealmModel> getCartItems() => realm.all<CartItemRealmModel>().toList();

  void addToCart(CartItemRealmModel item) {
final existing = realm.all<CartItemRealmModel>()
.query("productId == '${item.productId}'")
  .firstOrNull;

    realm.write(() {
      if (existing != null) {
        existing.quantity += item.quantity;
      } else {
        realm.add(item);
      }
    });
  }

  void increaseQuantity(String id) {
    final item = realm.find<CartItemRealmModel>(id);
    if (item != null) {
      realm.write(() => item.quantity += 1);
    }
  }

  void decreaseQuantity(String id) {
    final item = realm.find<CartItemRealmModel>(id);
    if (item != null && item.quantity > 1) {
      realm.write(() => item.quantity -= 1);
    }
  }

  void removeFromCart(String id) {
    final item = realm.find<CartItemRealmModel>(id);
    if (item != null) {
      realm.write(() => realm.delete(item));
    }
  }

  void clearCart() {
    realm.write(() => realm.deleteMany(realm.all<CartItemRealmModel>()));
  }

 void checkout() {
  final items = getCartItems();
  print("🛒 Cart Items Count: ${items.length}");

  realm.write(() {
    for (final item in items) {
      print("✅ Saving Order: ${item.name}");
      realm.add(OrderItemRealmModel(
        ObjectId(),
        item.name,
        item.quantity,
        item.price,
        DateTime.now(),
      ));
    }
  });
}

List<OrderItemRealmModel> getOrders() =>
    realm.all<OrderItemRealmModel>().toList().reversed.toList();

}