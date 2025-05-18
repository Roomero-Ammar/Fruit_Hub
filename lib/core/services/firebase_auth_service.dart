
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import '../errors/exceptions.dart';

class FirebaseAuthService 
{
/// Creates a new user with the provided email and password using Firebase Authentication.
///
/// Tries to create a user account with Firebase authentication service with the given [email] and [password].
/// If successful, it returns a [User] object representing the newly created user.
///
/// Throws a [CustomException] with an appropriate message if an error occurs during user creation:
/// - 'الرقم السري ضعيف جداً.' if the provided password is weak.
/// - 'البريد الالكتروني مستخدم بالفعل.' if the email is already in use.
/// - 'تاكد من اتصالك بالانترنت.' if there is a network issue.
/// - 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.' for any other errors.

  Future <User> createUserWithEmailAndPassword( String email, String password)async
   {
    try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );
  return credential.user!;
} on FirebaseAuthException catch (e) {
  log("Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()} and code is ${e.code}");
  if (e.code == 'weak-password') {
throw CustomException(message: 'الرقم السري ضعيف جداً.');  } else if (e.code == 'email-already-in-use') {
    throw CustomException(message: 'البريد الالكتروني مستخدم بالفعل.');
  }
  else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'تاكد من اتصالك بالانترنت.');
      }
  else{
    throw CustomException(message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.');}
} catch (e) {
  log("Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()}");
  throw CustomException(message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.');
}
   }
/////

  /// Signs in with the provided email and password using Firebase Authentication.
  ///
  /// Tries to sign in a user with Firebase authentication service with the given [email] and [password].
  /// If successful, it returns a [User] object representing the signed in user.
  ///
  /// Throws a [CustomException] with an appropriate message if an error occurs during sign in:
  /// - 'الرقم السري او البريد الالكتروني غير صحيح.' if the provided email or password is incorrect.
  /// - 'تاكد من اتصالك بالانترنت.' if there is a network issue.
  /// - 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.' for any other errors.
Future<User> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()} and code is ${e.code}");
      if (e.code == 'user-not-found') {
        throw CustomException(
            message: 'الرقم السري او البريد الالكتروني غير صحيح.');
      } else if (e.code == 'wrong-password') {
        throw CustomException(
            message: 'الرقم السري او البريد الالكتروني غير صحيح.');
      } else if (e.code == 'invalid-credential') {
        throw CustomException(
            message: 'الرقم السري او البريد الالكتروني غير صحيح.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'تاكد من اتصالك بالانترنت.');
      } else {
        throw CustomException(
            message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.');
      }
    } catch (e) {
      log("Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()}");

      throw CustomException(
          message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.');
    }
  }
}