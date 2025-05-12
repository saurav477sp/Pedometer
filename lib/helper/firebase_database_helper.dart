import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:pedometer/helper/firebase_helper.dart.dart';
import 'package:pedometer/widgets/popup/snackbar.dart';

class FirebaseDatabaseHelper {
  final db = FirebaseDatabase.instance;
  Future<bool> storeUserData({
    required Map<String, dynamic> data,
    required String email,
  }) async {
    try {
      DatabaseReference databaseReference = db.ref('user/$email');

      await databaseReference.set(data);
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

  Future<void> deleteUserDetails(String uid) async {
    try {
      await db.ref('user/$uid').remove();
    } on Exception catch (e) {
      log('database remove exception ======> $e');
    }
  }

  Future<Map<String, dynamic>?> findEmail(String email) async {
    try {
      final emailID = email.replaceAll('.', ',');
      final snapshot =
          await FirebaseDatabase.instance.ref('user').child(emailID).get();

      if (snapshot.exists) {
        final Map data = snapshot.value as Map;
        log('user data ======> ${data.toString()}');
        return data.map((key, value) => MapEntry(key.toString(), value));
      } else {
        log('no user data found');
        return null;
      }
    } on FirebaseException catch (e) {
      log('firebase exception while fetching email from database =======> ${e.toString()}');
      return null;
    } on Exception catch (e) {
      log('something went\'s wrong, please try again =====> ${e.toString()}');
      return null;
    }
  }
}
