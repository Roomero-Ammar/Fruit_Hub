import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/widgets/build_show_error_bar.dart';
import 'package:fruit_hub/core/widgets/custom_show_bar.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/helper_functions/spacing.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../core/widgets/password_field.dart';
import '../../cubits/signup_cubit/signup_cubit.dart';
import 'have_an_account_widget.dart';
import 'terms_and_conditions.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  // String? email, userName, password;

  late String email, userName, password;
  late bool isTermsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              verticalSpace(24),
              CustomTextFormField(
                onSaved: (value) {
                  userName = value!;
                },
                hintText: 'الاسم كامل',
                textInputType: TextInputType.name,
              ),
              verticalSpace(16),
              CustomTextFormField(
                onSaved: (value) {
                  email = value!;
                },
                hintText: 'البريد الإلكتروني',
                textInputType: TextInputType.emailAddress,
              ),
              verticalSpace(16),
              PasswordField(
                onSaved: (value) {
                  password = value!;
                },
              ),
              verticalSpace(16),
              TermsAndConditionsWidget(
                onChanged: (value) {
                  isTermsAccepted = value;
                },
              ),
              verticalSpace(30),
              CustomButton(
                onPressed: () {
                  print("isTermsAccepted");
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (isTermsAccepted) {


                      context
                          .read<SignupCubit>()
                          .createUserWithEmailAndPassword(
                            email,
                            password,
                            userName,
                          );
                    } 
                    
                    else {
                      showBar(context, 'يجب عليك الموافقة على الشروط والإحكام');
                    }
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                text: 'إنشاء حساب جديد',
              ),
              verticalSpace(26),
              HaveAnAccountWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

// What is autovalidateMode?
// autovalidateMode is a property on a Form that specifies when fields should be automatically validated.

// Possible values ​​for autovalidateMode:

// 1. AutovalidateMode.disabled:
// Validation is disabled. You must manually call validate() to validate the form.

// 2. AutovalidateMode.always:
// Fields will be automatically validated each time the form is created. This means errors will be immediately displayed upon data entry.

// 3. AutovalidateMode.onUserInteraction:
// Fields will only be validated after the user interacts with any field (such as clicking or typing). This option is convenient to avoid error messages before the user attempts to enter any data.
