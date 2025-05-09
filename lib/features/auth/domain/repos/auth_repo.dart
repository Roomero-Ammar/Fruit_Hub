import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/failures.dart';
import 'package:fruit_hub/features/auth/domain/entites/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure,UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  );
}
