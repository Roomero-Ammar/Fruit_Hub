
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:math' as math;

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

 // Sign in with google method.


  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  Future<User> signInWithFacebook() async {
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);
    final LoginResult loginResult =
        await FacebookAuth.instance.login(nonce: nonce);
    OAuthCredential facebookAuthCredential;

    if (Platform.isIOS) {
      switch (loginResult.accessToken!.type) {
        case AccessTokenType.classic:
          final token = loginResult.accessToken as ClassicToken;
          facebookAuthCredential = FacebookAuthProvider.credential(
            token.authenticationToken!,
          );
          break;
        case AccessTokenType.limited:
          final token = loginResult.accessToken as LimitedToken;
          facebookAuthCredential = OAuthCredential(
            providerId: 'facebook.com',
            signInMethod: 'oauth',
            idToken: token.tokenString,
            rawNonce: rawNonce,
          );
          break;
      }
    } else {
      facebookAuthCredential = FacebookAuthProvider.credential(
        loginResult.accessToken!.tokenString,
      );
    }

    return (await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential))
        .user!;
  }

  /// Generates a cryptographically secure random nonce, to be included in a
  /// credential request.
  String generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = math.Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
}