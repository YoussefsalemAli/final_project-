import 'dart:async';
import 'package:final_project/Config/Realm_config.dart';
import 'package:final_project/features/Authentication/repository/auth_repository.dart';
import 'package:final_project/features/Cart/controller/Cart_provider.dart';
import 'package:final_project/features/Cart/models/cart_item_model.dart';
import 'package:final_project/features/Orders/controller/order_provider.dart';
import 'package:final_project/features/Orders/models/order_model.dart';
import 'package:final_project/features/favorite/controller/favorite_provider.dart';
import 'package:final_project/features/favorite/models/favorite_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class Auth extends AsyncNotifier<bool> {

 @override
Future<bool> build() async {
  final user = FirebaseAuth.instance.currentUser;
  return user != null;
}
Future<void> clearUserData(WidgetRef ref) async {
  realm.write(() {
    realm.deleteAll<FavoriteProduct>();
    realm.deleteAll<CartItemRealmModel>();
    realm.deleteAll<OrderItemRealmModel>();
  });

  ref.invalidate(favoriteProductsProvider);
  ref.invalidate(cartItemsProvider);
  ref.invalidate(ordersProvider);
}
  Future<bool> createUser({
    required String email,
    required String password,
    required String username,
  }) async {
    state = const AsyncLoading();

    try {
      final result = await ref
          .read(asyncAuthRepoProvider)
          .createAccount(email: email, password: password,username: username);

      final success = result.user != null;
      state = AsyncData(success);
      return success;
    } catch (e, st) {
      print('Create user error : $e');

      state = AsyncError(e, st);
      return false;
  
    }
  }

  Future<bool> logout() async{
    try {
      await ref.read(asyncAuthRepoProvider).signOut();
      return true;
    } on FirebaseAuthException catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> loginUser({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final result = await ref
          .read(asyncAuthRepoProvider)
          .signIn(email: email, password: password);
      return result.user != null;
    });

    return state.value ?? false;
  }
  Future<bool> resetPassword({required String email}) async {
  try {
    await ref.read(asyncAuthRepoProvider).sendPasswordResetEmail(email);
    return true;
  } catch (e) {
    print("Reset password error: $e");
    return false;
  }
}
}

final asyncAuthProvider = AsyncNotifierProvider<Auth, bool>(Auth.new);

final authStateProvider = StreamProvider<User?>(
  (ref) => FirebaseAuth.instance.authStateChanges(),
);