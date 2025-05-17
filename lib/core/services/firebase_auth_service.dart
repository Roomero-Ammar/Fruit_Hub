
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import '../errors/exceptions.dart';

class FirebaseAuthService 
{
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
}