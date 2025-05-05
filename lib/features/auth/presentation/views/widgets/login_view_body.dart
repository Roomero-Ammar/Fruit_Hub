import 'package:flutter/widgets.dart';
import 'package:fruit_hub/core/widgets/custom_app_bar_widget.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // CustomAppBar(title: "تسجيل الدخول", showBackButton: true,showNotification: false),
        ],
      ),
    );
  }
}