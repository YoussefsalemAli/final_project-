import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realm/realm.dart';
import '../models/favorite_model.dart';

final realmProvider = Provider<Realm>(
  (ref) => Realm(Configuration.local([FavoriteProduct.schema])),
);

class FavoriteNotifier extends StateNotifier<List<FavoriteProduct>> {
  final Realm _realm;

  FavoriteNotifier(this._realm) : super(_realm.all<FavoriteProduct>().toList());

  void toggle(FavoriteProduct product) {
    final existing = _realm.find<FavoriteProduct>(product.id);
    _realm.write(() {
      if (existing != null) {
        _realm.delete(existing);
      } else {
        _realm.add(product);
      }
    });

    state = _realm.all<FavoriteProduct>().toList();
  }

  bool isFavorite(String id) => _realm.find<FavoriteProduct>(id) != null;
}

final favoriteProductsProvider =
    StateNotifierProvider<FavoriteNotifier, List<FavoriteProduct>>((ref) {
  final realm = ref.watch(realmProvider);
  return FavoriteNotifier(realm);
});
