import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/signup_view_body.dart';

import '../../cubits/signup_cubit/cubit/signup_cubit.dart';

class SignupViewBlocConsumer extends StatelessWidget {
  const SignupViewBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SignupViewBody();
      },
    );
  }
}
