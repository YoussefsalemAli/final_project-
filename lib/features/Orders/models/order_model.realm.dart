// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
class OrderItemRealmModel extends _OrderItemRealmModel
    with RealmEntity, RealmObjectBase, RealmObject {
  OrderItemRealmModel(
    ObjectId id,
    String name,
    int quantity,
    double price,
    DateTime date,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'quantity', quantity);
    RealmObjectBase.set(this, 'price', price);
    RealmObjectBase.set(this, 'date', date);
  }

  OrderItemRealmModel._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  int get quantity => RealmObjectBase.get<int>(this, 'quantity') as int;
  @override
  set quantity(int value) => RealmObjectBase.set(this, 'quantity', value);

  @override
  double get price => RealmObjectBase.get<double>(this, 'price') as double;
  @override
  set price(double value) => RealmObjectBase.set(this, 'price', value);

  @override
  DateTime get date => RealmObjectBase.get<DateTime>(this, 'date') as DateTime;
  @override
  set date(DateTime value) => RealmObjectBase.set(this, 'date', value);

  @override
  Stream<RealmObjectChanges<OrderItemRealmModel>> get changes =>
      RealmObjectBase.getChanges<OrderItemRealmModel>(this);

  @override
  Stream<RealmObjectChanges<OrderItemRealmModel>> changesFor([
    List<String>? keyPaths,
  ]) => RealmObjectBase.getChangesFor<OrderItemRealmModel>(this, keyPaths);

  @override
  OrderItemRealmModel freeze() =>
      RealmObjectBase.freezeObject<OrderItemRealmModel>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'name': name.toEJson(),
      'quantity': quantity.toEJson(),
      'price': price.toEJson(),
      'date': date.toEJson(),
    };
  }

  static EJsonValue _toEJson(OrderItemRealmModel value) => value.toEJson();
  static OrderItemRealmModel _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'name': EJsonValue name,
        'quantity': EJsonValue quantity,
        'price': EJsonValue price,
        'date': EJsonValue date,
      } =>
        OrderItemRealmModel(
          fromEJson(id),
          fromEJson(name),
          fromEJson(quantity),
          fromEJson(price),
          fromEJson(date),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(OrderItemRealmModel._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
      ObjectType.realmObject,
      OrderItemRealmModel,
      'OrderItemRealmModel',
      [
        SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
        SchemaProperty('name', RealmPropertyType.string),
        SchemaProperty('quantity', RealmPropertyType.int),
        SchemaProperty('price', RealmPropertyType.double),
        SchemaProperty('date', RealmPropertyType.timestamp),
      ],
    );
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
