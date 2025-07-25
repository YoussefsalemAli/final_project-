import 'package:realm/realm.dart';

part 'favorite_model.realm.dart';

@RealmModel()
class _FavoriteProduct {
  @PrimaryKey()
  late int id;

  late String? name;
  late String? image;
  late double? price;
  late double? rate;
}
