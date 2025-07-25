// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
class FavoriteProduct extends _FavoriteProduct
    with RealmEntity, RealmObjectBase, RealmObject {
  FavoriteProduct(
    int id, {
    String? name,
    String? image,
    double? price,
    double? rate,
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'image', image);
    RealmObjectBase.set(this, 'price', price);
    RealmObjectBase.set(this, 'rate', rate);
  }

  FavoriteProduct._();

  @override
  int get id => RealmObjectBase.get<int>(this, 'id') as int;
  @override
  set id(int value) => RealmObjectBase.set(this, 'id', value);

  @override
  String? get name => RealmObjectBase.get<String>(this, 'name') as String?;
  @override
  set name(String? value) => RealmObjectBase.set(this, 'name', value);

  @override
  String? get image => RealmObjectBase.get<String>(this, 'image') as String?;
  @override
  set image(String? value) => RealmObjectBase.set(this, 'image', value);

  @override
  double? get price => RealmObjectBase.get<double>(this, 'price') as double?;
  @override
  set price(double? value) => RealmObjectBase.set(this, 'price', value);

  @override
  double? get rate => RealmObjectBase.get<double>(this, 'rate') as double?;
  @override
  set rate(double? value) => RealmObjectBase.set(this, 'rate', value);

  @override
  Stream<RealmObjectChanges<FavoriteProduct>> get changes =>
      RealmObjectBase.getChanges<FavoriteProduct>(this);

  @override
  Stream<RealmObjectChanges<FavoriteProduct>> changesFor([
    List<String>? keyPaths,
  ]) => RealmObjectBase.getChangesFor<FavoriteProduct>(this, keyPaths);

  @override
  FavoriteProduct freeze() =>
      RealmObjectBase.freezeObject<FavoriteProduct>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'name': name.toEJson(),
      'image': image.toEJson(),
      'price': price.toEJson(),
      'rate': rate.toEJson(),
    };
  }

  static EJsonValue _toEJson(FavoriteProduct value) => value.toEJson();
  static FavoriteProduct _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {'id': EJsonValue id} => FavoriteProduct(
        fromEJson(id),
        name: fromEJson(ejson['name']),
        image: fromEJson(ejson['image']),
        price: fromEJson(ejson['price']),
        rate: fromEJson(ejson['rate']),
      ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(FavoriteProduct._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
      ObjectType.realmObject,
      FavoriteProduct,
      'FavoriteProduct',
      [
        SchemaProperty('id', RealmPropertyType.int, primaryKey: true),
        SchemaProperty('name', RealmPropertyType.string, optional: true),
        SchemaProperty('image', RealmPropertyType.string, optional: true),
        SchemaProperty('price', RealmPropertyType.double, optional: true),
        SchemaProperty('rate', RealmPropertyType.double, optional: true),
      ],
    );
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
