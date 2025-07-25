// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
class CartItemRealmModel extends _CartItemRealmModel
    with RealmEntity, RealmObjectBase, RealmObject {
  CartItemRealmModel(
    String id,
    String productId,
    String name,
    String image,
    double price,
    int quantity,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'productId', productId);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'image', image);
    RealmObjectBase.set(this, 'price', price);
    RealmObjectBase.set(this, 'quantity', quantity);
  }

  CartItemRealmModel._();

  @override
  String get id => RealmObjectBase.get<String>(this, 'id') as String;
  @override
  set id(String value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get productId =>
      RealmObjectBase.get<String>(this, 'productId') as String;
  @override
  set productId(String value) => RealmObjectBase.set(this, 'productId', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  String get image => RealmObjectBase.get<String>(this, 'image') as String;
  @override
  set image(String value) => RealmObjectBase.set(this, 'image', value);

  @override
  double get price => RealmObjectBase.get<double>(this, 'price') as double;
  @override
  set price(double value) => RealmObjectBase.set(this, 'price', value);

  @override
  int get quantity => RealmObjectBase.get<int>(this, 'quantity') as int;
  @override
  set quantity(int value) => RealmObjectBase.set(this, 'quantity', value);

  @override
  Stream<RealmObjectChanges<CartItemRealmModel>> get changes =>
      RealmObjectBase.getChanges<CartItemRealmModel>(this);

  @override
  Stream<RealmObjectChanges<CartItemRealmModel>> changesFor([
    List<String>? keyPaths,
  ]) => RealmObjectBase.getChangesFor<CartItemRealmModel>(this, keyPaths);

  @override
  CartItemRealmModel freeze() =>
      RealmObjectBase.freezeObject<CartItemRealmModel>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'productId': productId.toEJson(),
      'name': name.toEJson(),
      'image': image.toEJson(),
      'price': price.toEJson(),
      'quantity': quantity.toEJson(),
    };
  }

  static EJsonValue _toEJson(CartItemRealmModel value) => value.toEJson();
  static CartItemRealmModel _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'productId': EJsonValue productId,
        'name': EJsonValue name,
        'image': EJsonValue image,
        'price': EJsonValue price,
        'quantity': EJsonValue quantity,
      } =>
        CartItemRealmModel(
          fromEJson(id),
          fromEJson(productId),
          fromEJson(name),
          fromEJson(image),
          fromEJson(price),
          fromEJson(quantity),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(CartItemRealmModel._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
      ObjectType.realmObject,
      CartItemRealmModel,
      'CartItemRealmModel',
      [
        SchemaProperty('id', RealmPropertyType.string, primaryKey: true),
        SchemaProperty('productId', RealmPropertyType.string),
        SchemaProperty('name', RealmPropertyType.string),
        SchemaProperty('image', RealmPropertyType.string),
        SchemaProperty('price', RealmPropertyType.double),
        SchemaProperty('quantity', RealmPropertyType.int),
      ],
    );
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
