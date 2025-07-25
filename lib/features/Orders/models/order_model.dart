import 'package:realm/realm.dart';
part 'order_model.realm.dart';

@RealmModel()
class _OrderItemRealmModel {
  @PrimaryKey()
  late ObjectId id;
  late String name;
  late int quantity;
  late double price;
  late DateTime date;
}
