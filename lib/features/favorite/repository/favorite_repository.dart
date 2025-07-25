import 'package:realm/realm.dart';
import '../models/favorite_model.dart';

class FavoriteRepository {
  final Realm realm;

  FavoriteRepository(this.realm);

  List<FavoriteProduct> getFavorites() {
    return realm.all<FavoriteProduct>().toList();
  }

  void toggleFavorite(FavoriteProduct product) {
    final exists = realm.find<FavoriteProduct>(product.id);
    realm.write(() {
      if (exists != null) {
        realm.delete(exists);
      } else {
        realm.add(product);
      }
    });
  }
}
