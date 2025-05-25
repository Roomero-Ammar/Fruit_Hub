import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/widgets/build_show_bar.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/signup_view_body.dart';
import '../../../../../core/widgets/custom_progress_hud.dart';
import '../../cubits/signup_cubit/signup_cubit.dart';

class SignupViewBodyBlocConsumer extends StatelessWidget {
  const SignupViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
if (state is SignupSuccess) {
          Navigator.of(context).pop();
          showBar(context, "تم التسجيل بنجاح");
        }

        if (state is SignupFailure) {
          showBar(context, state.message);
        }      },
      builder: (context, state) {
         return CustomProgressHud(
          isLoading: state is SignupLoading ? true : false,
          child: const SignupViewBody(),
        );
        // return ModalProgressHUD(
        //   inAsyncCall: state is SignupLoading ? true:false,
        //   child: SignupViewBody(),
        //   );
      },
    );
  }
}
