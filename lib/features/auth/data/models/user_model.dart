import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/features/auth/domain/entites/user_entity.dart';

class UserModel extends UserEntity{
  UserModel({required super.name, required super.email, required super.uId});
  
// factory constructor to convert firebase user to user model object 
  factory UserModel.fromFirebaseUser(User user){
    return UserModel(
      name: user.displayName ?? '',
      email: user.email ?? '',
      uId: user.uid,
    );
  }
}