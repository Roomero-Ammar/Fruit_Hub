import 'dart:convert';
import 'dart:developer';  // responible for logging errors "log"

import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/exceptions.dart';
import 'package:fruit_hub/core/errors/failures.dart';
import '../../../../core/services/firebase_auth_service.dart';
import '../../domain/entites/user_entity.dart';
import '../../domain/repos/auth_repo.dart';
import '../models/user_model.dart';


class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImpl({required this.firebaseAuthService});
  @override
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
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      log("Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}");
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('حدث خطأ ما. الرجاء المحاولة مرة اخرى.'));
    }
  }
}
