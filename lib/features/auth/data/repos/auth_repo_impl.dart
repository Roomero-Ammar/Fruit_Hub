import 'dart:convert';
import 'dart:developer'; // responible for logging errors "log"

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/errors/exceptions.dart';
import 'package:fruit_hub/core/errors/failures.dart';
import 'package:fruit_hub/core/services/database_service.dart';
import 'package:fruit_hub/core/utils/backend_endpoint.dart';
import '../../../../core/services/firebase_auth_service.dart'; // [Our Back-end]
import '../../domain/entites/user_entity.dart';
import '../../domain/repos/auth_repo.dart';
import '../models/user_model.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService; // [Our Back-end]
  final DatabaseService databaseService;
  AuthRepoImpl({
    required this.databaseService,
    required this.firebaseAuthService,
  });

  @override
  /////////////////[createUserWithEmailAndPassword]/////////////////
  /// Creates a new user with the provided email, password, and name
  ///
  /// Returns a [Right] with a [UserEntity] if the operation is successful, or a
  /// [Left] with a [Failure] if not. If a [CustomException] is thrown, it will
  /// be converted to a [ServerFailure] and returned as a [Left].
  /// Any other error will be converted to a [ServerFailure] with a default message and
  /// returned as a [Left].
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
        email,
        password,
      );
      var userEntity = UserModel.fromFirebaseUser(user);
      await addUserData(user: userEntity); // it's responsible for add user data to database after create user.
      return Right(userEntity);
    } on CustomException catch (e) {
      log(
        "Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}",
      );
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('حدث خطأ ما. الرجاء المحاولة مرة اخرى.'));
    }
  }

  //----------------------------------------------------------------------//

  @override
  /////////////////[signInWithEmailAndPassword]/////////////////
  /// Signs in with the provided email and password using Firebase Authentication.
  //
  /// Returns a [Right] with a [UserEntity] if the operation is successful, or a
  /// [Left] with a [Failure] if not. If a [CustomException] is thrown, it will
  /// be converted to a [ServerFailure] and returned as a [Left].
  /// Any other error will be converted to a [ServerFailure] with a default message and
  /// returned as a [Left].
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      log(
        "Exception in AuthRepoImpl.signInWithEmailAndPassword: ${e.toString()}",
      );
      return Left(ServerFailure('حدث خطأ ما. الرجاء المحاولة مرة اخرى.'));
    }
  }
  //----------------------------------------------------------------------//

  @override
  /////////////////[signInWithGoogle]/////////////////
  /// Returns a [Right] with a [UserEntity] if the operation is successful, or a
  /// [Left] with a [Failure] if not. If a [CustomException] is thrown, it will
  /// be converted to a [ServerFailure] and returned as a [Left].
  /// Any other error will be converted to a [ServerFailure] with a default message and
  /// returned as a [Left].
  Future<Either<Failure, UserEntity>> signinWithGoogle() async {
    try {
      var user = await firebaseAuthService.signInWithGoogle();
      return Right(UserModel.fromFirebaseUser(user));
    }
    // [we don't need to write this custom exception]
    on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    }
    //
    catch (e) {
      log("Exception in AuthRepoImpl.signupWithGoogle: ${e.toString()}");
      return Left(ServerFailure('حدث خطأ ما. الرجاء المحاولة مرة اخرى.'));
    }
  }

  @override
  /////////////////[signUpWithFacebook]/////////////////
  Future<Either<Failure, UserEntity>> signinWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithFacebook();
      var userEntity = UserModel.fromFirebaseUser(user);

      return right(userEntity);
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}',
      );
      return left(ServerFailure('حدث خطأ ما. الرجاء المحاولة مرة اخرى.'));
    }
  }
 // this method is used to add user data to the database after signup.
  @override
  Future addUserData({required UserEntity user}) async {
    await databaseService.addData(
      path: BackendEndpoint.addUserData,
      data: user.toMap(),
    );
  }
}
