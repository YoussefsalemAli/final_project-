import 'package:final_project/Config/Realm_config.dart';
import 'package:final_project/features/Cart/models/cart_item_model.dart';
import 'package:final_project/features/Orders/models/order_model.dart';
import 'package:final_project/features/favorite/models/favorite_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => firebaseAuth.authStateChanges();

  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    return await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password, 
    );
  }
  Future<void> sendPasswordResetEmail(String email) {
    return firebaseAuth.sendPasswordResetEmail(email: email);
  }
Future<UserCredential> createAccount({
  required String email,
  required String password,
  required String username, 
}) async {
  try {
    final result = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = result.user;

    await user?.updateDisplayName(username);
    await user?.reload();

    realm.write(() {
      realm.deleteAll<FavoriteProduct>();
      realm.deleteAll<CartItemRealmModel>();
      realm.deleteAll<OrderItemRealmModel>();
      print('REALM DELETED😋😋😋😋😋😋😘😘');
    });

    print("✅ User created: ${user?.email} with name: ${user?.displayName}");

    return result;
  } catch (e) {
    print("❌ Create user error: $e");
    rethrow;
  }
}
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  Future<void> resetPassword({required String email}) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<void> updateUserName({required String username}) async {
    await currentUser!.updateDisplayName(username);
  }

  Future<void> deleteUsername({
    required String email,
    required String password,
  }) async {
    AuthCredential credential = EmailAuthProvider.credential(
      email: email,
      password: password,
    );
    await currentUser!.reauthenticateWithCredential(credential);
    await currentUser!.delete();
    await firebaseAuth.signOut();
  }

  Future<void> resetPasswordFromCurrentPassword({
    required String currentPassword,
    required String newPassword,
    required String email,
  }) async {
    AuthCredential credential = EmailAuthProvider.credential(
      email: email,
      password: currentPassword,
    );
    await currentUser!.reauthenticateWithCredential(credential);
    await currentUser!.updatePassword(newPassword);
  }
}

final asyncAuthRepoProvider = Provider<AuthRepository>(
  (ref) => AuthRepository(),
);
