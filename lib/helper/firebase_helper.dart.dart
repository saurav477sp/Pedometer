import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pedometer/config/routes/app_route.dart';
import 'package:pedometer/helper/firebase_database_helper.dart';
import 'package:pedometer/helper/local_storage_helper.dart';
import 'package:pedometer/widgets/popup/snackbar.dart';

class FirebaseHelper {
  final auth = FirebaseAuth.instance;

  Future<User?> signUpwithEmailandPassword({
    required String email,
    required String password,
    required String userName,
  }) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      log(userCredential.toString());

      if (userCredential.user != null) {
        String emailID = email.replaceAll('.', ',');
        log(emailID);
        await userCredential.user!.updateDisplayName(userName);
        bool isStored = await FirebaseDatabaseHelper().storeUserData(
          email: emailID,
          data: {'userName': userName},
        );

        if (isStored) return userCredential.user;
      }
    } on FirebaseException catch (e) {
      log('firebase create user firebase exception =======>  ${e.toString()}');
      showSnackbar(getFriendlyAuthMessage(e.code));
    } catch (e) {
      log('firebase create user exception =======>  ${e.toString()}');
      showSnackbar('something went\'s wrong, please try again');
    }
    return null;
  }

  Future<User?> signinUser(String email, String password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      log(userCredential.toString());

      if (userCredential.user != null) {
        return userCredential.user;
      }
    } on FirebaseException catch (e) {
      log('firebase sign in firebase exception =======>  ${e.toString()}');
      showSnackbar(getFriendlyAuthMessage(e.code));
    } on Exception catch (e) {
      log('firebase sign in exception =======>  ${e.toString()}');
      showSnackbar(getFriendlyAuthMessage(e.toString()));
    }
    return null;
  }

  // Future<bool> isEmailRegistered(String email) async {
  //   try {
  //     log(email);
  //     // this method works only when email enauration is desabled in cosole but it is not recomended
  //     var signInMethods = await FirebaseAuth.instance
  //         .fetchSignInMethodsForEmail(email.trim());
  //     log(signInMethods.toString());
  //     return signInMethods.isNotEmpty;
  //   } on FirebaseException catch (e) {
  //     log(
  //       'firebase exception for check mail exist or not =====>  ${e.message.toString()}',
  //     );
  //     showSnackbar(e.message.toString());
  //     return false;
  //   } on Exception catch (e) {
  //     log('exception while checking email id ======> $e');
  //     showSnackbar('please try again');
  //     return false;
  //   }
  // }

  Future<void> signout() async {
    try {
      await auth.signOut();
      LocalStorageHelper.removeItem('uid');
      showSnackbar('user sign out');
      Get.offAllNamed(AppRoute.getStarted);
    } on Exception catch (e) {
      showSnackbar(e.toString());
    }
  }

  Future<void> deleteCurrentUser() async {
    try {
      User? user = auth.currentUser;
      if (user != null) await user.delete();
    } on Exception catch (e) {
      log('delete user exceptions ======> $e');
    }
  }

  String getFriendlyAuthMessage(String errorCode) {
    switch (errorCode) {
      case 'user-not-found':
        return 'No account found with this email.';
      case 'wrong-password':
        return 'Please enter valide password';
      case 'email-already-in-use':
        return 'This email is already in use. Try logging in instead.';
      case 'invalid-email':
        return 'Invalid email format.';
      case 'weak-password':
        return 'Password is too weak. Use a stronger one.';
      case 'network-request-failed':
        return 'Network error. Check your connection and try again.';
      case 'operation-not-allowed':
        return 'This sign-in method is not enabled. Contact support.';
      case 'too-many-requests':
        return 'We’ve blocked requests from this device due to unusual activity. Please try again later.';
      case 'invalid-credential':
        return 'please enter valide email and password';
      default:
        return 'Something went wrong. Please try again later.';
    }
  }
}
