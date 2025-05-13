import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/exceptions.dart';

import 'package:fruit_hub/core/errors/failures.dart';

import 'package:fruit_hub/features/auth/domain/entites/user_entity.dart';

import '../../../../core/services/firebase_auth_service.dart';
import '../../domain/repos/auth_repo.dart';
import '../models/user_model.dart';

class AuthRepoImpl extends AuthRepo {

final FirebaseAuthService firebaseAuthService;

  AuthRepoImpl({required this.firebaseAuthService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(String email, String password, String name) async{
  try {
  var user = await  firebaseAuthService.createUserWithEmailAndPassword(email, password);
  return Right(UserModel.fromFirebaseUser(user));
} on CustomException catch (e) {
   return Left(ServerFailure(e.message));
}catch (e) {
   return Left(ServerFailure('An Error occured. Please try again.'));
  }
  }
}