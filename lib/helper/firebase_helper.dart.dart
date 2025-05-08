import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:pedometer/pages/home.dart';
import 'package:pedometer/pages/login.dart';
import 'package:pedometer/widgets/custom_snackbar.dart';

class FirebaseHelper {
  final auth = FirebaseAuth.instance;

  Future<bool> signUpwithEmailandPassword({
    required String email,
    required String password,
    required String userName,
  }) async {
    try {
      final auth = FirebaseAuth.instance;
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      log(userCredential.toString());

      await storeUserData(
        uid: userCredential.user!.uid,
        userName: userName,
        email: email,
      );

      return true;
    } on FirebaseException catch (e) {
      CustomSnackbar.showSnackbar('Error', e.message.toString());
      return false;
    } catch (e) {
      CustomSnackbar.showSnackbar('Error', e.toString());
      return false;
    }
  }

  Future<void> storeUserData({
    required String uid,
    required String userName,
    required String email,
  }) async {
    try {
      DatabaseReference databaseReference = FirebaseDatabase.instance.ref(
        'user',
      );

      await databaseReference.child(uid).set({
        'userName': userName,
        'email': email,
      });
    } on FirebaseException catch (e) {
      CustomSnackbar.showSnackbar('problem', e.message.toString());
    }
  }

  Future<void> signinUser(String email, String password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      log(userCredential.toString());

      if (userCredential.user != null) {
        CustomSnackbar.showSnackbar('user', 'user loged in');
        Get.offAll(() => const Home());
      }
    } on FirebaseException catch (e) {
      CustomSnackbar.showSnackbar('error', e.message.toString());
    } on Exception catch (e) {
      CustomSnackbar.showSnackbar('error', e.toString());
    }
  }

  Future<void> fetchEmail(String email) async {
    try {
      DatabaseReference ref = FirebaseDatabase.instance.ref('user');
      DatabaseEvent event = await ref.once();
      DataSnapshot snapshot = event.snapshot;

      if (snapshot.value != null) {
        Map<dynamic, dynamic> userdata =
            snapshot.value as Map<dynamic, dynamic>;
        List<String> emails = [];

        userdata.forEach((key, value) {
          if (value is Map && value.containsKey('email')) {
            emails.add(value['email']);
          }
        });

        log(emails.toString());
      }
    } on FirebaseException catch (e) {
      log(e.message.toString());
    }
  }

  Future<bool> changePassword(String email, String newPassword) async {
    try {
      await fetchEmail(email);
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: newPassword,
      );
      User? user = userCredential.user;
      if (user != null) {
        await user.updatePassword(newPassword);
      } else {
        CustomSnackbar.showSnackbar('error', 'something wents wrong');
      }
      return true;
    } on FirebaseAuthException catch (e) {
      CustomSnackbar.showSnackbar('problem', e.message.toString());
      log(e.message.toString());
      return false;
    }
  }

  Future<bool> isEmailRegistered(String email) async {
    try {
      log(email);
      var signInMethods = await FirebaseAuth.instance
          .fetchSignInMethodsForEmail(email.trim());
      log(signInMethods.toString());
      return signInMethods.isNotEmpty;
    } on FirebaseException catch (e) {
      CustomSnackbar.showSnackbar('error', e.message.toString().toLowerCase());
      log(e.message.toString());
      return false;
    }
  }

  Future<void> signout() async {
    try {
      await auth.signOut();
      CustomSnackbar.showSnackbar('sign out', 'user sign out');
      Get.offAll(() => const Login());
    } on Exception catch (e) {
      CustomSnackbar.showSnackbar('Error', e.toString());
    }
  }
}
