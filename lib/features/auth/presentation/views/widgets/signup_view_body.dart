import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/helper_functions/spacing.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../core/widgets/password_field.dart';
import 'have_an_account_widget.dart';
import 'terms_and_conditions.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
        child: Column(
          children: [
            verticalSpace(24),
             CustomTextFormField(
                  onSaved: (value) {
                  },
                  hintText: 'الاسم كامل',
                  textInputType: TextInputType.name),
            verticalSpace(16),
            CustomTextFormField(
              hintText: 'البريد الإلكتروني',
              textInputType: TextInputType.emailAddress,
            ),
            verticalSpace(16),
            PasswordField(),
            verticalSpace(16),
            TermsAndConditionsWidget(onChanged: (value) {}),
            verticalSpace(30),
            CustomButton(onPressed: (){}, text: 'إنشاء حساب جديد',),
            verticalSpace(26),
            HaveAnAccountWidget(),
          ],
        ),
      ),
    );
  }
}
