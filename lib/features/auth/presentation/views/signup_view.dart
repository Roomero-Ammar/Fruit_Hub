import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/services/get_it_service.dart';
import 'package:fruit_hub/core/widgets/custom_app_bar.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';
import '../cubits/signup_cubit/cubit/signup_cubit.dart';
import 'widgets/signup_view_bloc_consumer.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: "حساب جديد",
        showBackButton: true,
        showNotification: false,
      ),
      body: BlocProvider(
        create: (context) => SignupCubit(getIt<AuthRepo>()),
        child: SignupViewBlocConsumer(),
      ),
    );
  }
}

