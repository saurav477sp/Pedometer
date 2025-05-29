import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:pedometer/config/models/user_model.dart';
import 'package:pedometer/helper/firebase_helper.dart.dart';
import 'package:pedometer/widgets/popup/snackbar.dart';

class FirebaseDatabaseHelper {
  final db = FirebaseDatabase.instance;

  Future<bool> storeUserData({required UserModel user}) async {
    try {
      final emailKey = user.email.replaceAll('.', ',');
      final ref = db.ref('user/$emailKey');
      await ref.set(user.toMap());
      return true;
    } on FirebaseException catch (e) {
      FirebaseHelper().deleteCurrentUser();
      log('Data storing firebase exception ====> ${e.toString()}');
      showSnackbar(e.message.toString());
      return false;
    } on Exception catch (e) {
      FirebaseHelper().deleteCurrentUser();
      log('Data storing exception ====> ${e.toString()}');
      showSnackbar('please try again');
      return false;
    }
  }

  Future<UserModel?> findEmail(String email) async {
    try {
      final emailKey = email.replaceAll('.', ',');
      final snapshot = await db.ref('user/$emailKey').get();

      if (snapshot.exists) {
        final map = Map<String, dynamic>.from(snapshot.value as Map);
        log('user data ======> ${map.toString()}');
        return UserModel.fromMap(map);
      }
    } on FirebaseException catch (e) {
      log(
        'firebase exception while fetching email from database =======> ${e.toString()}',
      );
    } on Exception catch (e) {
      log('something went\'s wrong, please try again =====> ${e.toString()}');
    }

    return null;
  }

  Future<void> deleteUserDetails(String email) async {
    try {
      final emailKey = email.replaceAll('.', ',');
      await db.ref('user/$emailKey').remove();
    } on Exception catch (e) {
      log('database remove exception ======> $e');
    }
  }
}
