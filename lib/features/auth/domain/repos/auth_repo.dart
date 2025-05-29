import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/failures.dart';
import 'package:fruit_hub/features/auth/domain/entites/user_entity.dart';

abstract class AuthRepo {
  /// Creates a new user in the authentication system with the given 
  /// [email],[password], and [name].
  ///
  /// Returns a [UserEntity] on success, or a [Failure] on failure.
  Future<Either<Failure,UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  );

  /// Signs in the user with the given [email] and [password].
  ///
  /// Returns a [UserEntity] on success, or a [Failure] on failure.
  Future<Either<Failure,UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  );
  // Signs in with Google.
  Future<Either<Failure, UserEntity>> signinWithGoogle();
  // Signs in with Facebook.
   Future<Either<Failure, UserEntity>> signinWithFacebook();



// this function is used to add user data to the database
   Future addUserData({required UserEntity user});
}
