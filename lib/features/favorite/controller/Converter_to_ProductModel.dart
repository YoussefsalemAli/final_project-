import 'package:final_project/features/favorite/models/favorite_model.dart';
import 'package:final_project/features/products/models/product_model.dart';

extension FavoriteConverter on FavoriteProduct {
  ProductModel toProductModel() {
    return ProductModel(
      id: id,
      name: name??'',
      description: '',
      price: price??0.0,
      image: image??'', rate:rate??0.0 ,
    );
  }
}