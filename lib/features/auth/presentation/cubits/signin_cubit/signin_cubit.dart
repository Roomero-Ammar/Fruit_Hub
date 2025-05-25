import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';

import '../../../domain/entites/user_entity.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authRepo) : super(SigninInitial());
  final AuthRepo authRepo;
  /// Signs in a user with the given email and password using Firebase Authentication.
  ///
  /// If successful, it emits a [SigninSuccess] state with the signed in user.
  /// If not, it emits a [SigninFailure] state with a message describing what went wrong.
  ///
  /// See [AuthRepo.signInWithEmailAndPassword] for possible exceptions that can be thrown.
  Future<void> signin(String email, String password) async {
    emit(SigninLoading());
    final result = await authRepo.signInWithEmailAndPassword(email, password);
    result.fold(
      (failure) => emit(SigninFailure(message: failure.message)),
      (userEntity) => emit(SigninSuccess(userEntity: userEntity)),
    );
  }
}
