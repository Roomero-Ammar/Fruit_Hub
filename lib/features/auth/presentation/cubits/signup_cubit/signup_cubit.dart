import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entites/user_entity.dart';
import '../../../domain/repos/auth_repo.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo) : super(SignupInitial());

  final AuthRepo authRepo;


  /// Creates a new user with the given email, password and name using the provided [AuthRepo].
  ///
  /// Emits [SignupLoading] while waiting for the operation to complete.
  ///
  /// If successful, it emits [SignupSuccess] with the created user entity.
  /// If not, it emits [SignupFailure] with a message describing what went wrong.
  Future<void> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    emit(SignupLoading());
    final result =
        await authRepo.createUserWithEmailAndPassword(email, password, name);
    result.fold(
      (failure) => emit(
        SignupFailure(message: failure.message),
      ),
      (userEntity) => emit(
        SignupSuccess(userEntity: userEntity),
      ),
    );
  }
}