import 'package:final_project/features/Cart/models/cart_item_model.dart';
import 'package:final_project/features/Orders/models/order_model.dart';
import 'package:final_project/features/favorite/models/favorite_model.dart';
import 'package:realm/realm.dart';


late Realm realm;

void initRealm() {
  // Initialize Realm
  final config = Configuration.local([FavoriteProduct.schema,CartItemRealmModel.schema,OrderItemRealmModel.schema,]);
  realm = Realm(config);
}

