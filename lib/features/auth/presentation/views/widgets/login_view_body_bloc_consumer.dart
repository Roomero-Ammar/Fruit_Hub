import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/Routing/routes.dart';
import 'package:fruit_hub/core/helper_functions/extentsions.dart';
import 'package:fruit_hub/core/widgets/build_show_bar.dart';
import 'package:fruit_hub/features/auth/presentation/views/signup_view.dart';
import '../../../../../core/widgets/custom_progress_hud.dart';
import '../../cubits/signin_cubit/signin_cubit.dart';
import 'login_view_body.dart';

class LoginViewBodyBlocConsumer extends StatelessWidget {
  const LoginViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninSuccess) {
          print('Logged in Done');


//           Navigator.of(context).push(
//   MaterialPageRoute(builder: (_) => const SignupView()),
// );

          context.pushNamed(Routes.signUpView);
          // Navigator.pushNamed(context, MainView.routeName);
        }

        if (state is SigninFailure) {
          showBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is SigninLoading ? true : false,
          child: const LoginViewBody(),
        );
      },
    );
  }
}