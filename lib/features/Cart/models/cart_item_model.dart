import 'package:realm/realm.dart';

part 'cart_item_model.realm.dart';

@RealmModel()
class _CartItemRealmModel {
  @PrimaryKey()
  late String id;

  late String productId;
  late String name;
  late String image;
  late double price;
  late int quantity;
}
