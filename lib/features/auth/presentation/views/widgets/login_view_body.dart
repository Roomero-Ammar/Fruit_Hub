import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/helper_functions/spacing.dart';
import 'package:fruit_hub/core/widgets/custom_app_bar_widget.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/core/widgets/custom_text_field.dart';
import 'package:fruit_hub/core/widgets/password_field.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/or_divider.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../cubits/signin_cubit/signin_cubit.dart';
import 'dont_have_an_account_widget.dart';
import 'social_login_button.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  // String? email, password;

  late String email, password;

  @override
  Widget build(BuildContext context) {
   return  SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              verticalSpace(24),
              // CustomAppBar(title: "تسجيل الدخول", showBackButton: true,showNotification: false),
              CustomTextFormField(
                onSaved: (value){email = value!;},
                hintText: "البريد الالكتروني",
                textInputType: TextInputType.emailAddress,
              ),
              verticalSpace(16),
              PasswordField(
                onSaved: (value){password = value!;},
              ),
              verticalSpace(16),
               Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'نسيت كلمة المرور؟',
                        style: TextStyles.semiBold13.copyWith(
                          color: AppColors.lightPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(16),
                  CustomButton( onPressed: () {
                    if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    // Trigger the signin cubit to signin the user with the provided email and password 
                    context.read<SigninCubit>().signin(email, password);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                  }, text: 'تسجيل دخول'),
                  verticalSpace(33),
                  const DontHaveAnAccountWidget(),
                  verticalSpace(33),
                  const OrDivider(),
                  verticalSpace(16),
                    SocialLoginButton(
                  onPressed: () {
                  
                  },
                  image: Assets.imagesGoogleIcon,
                  title: 'تسجيل بواسطة جوجل',
                ),
                verticalSpace(16),
                 SocialLoginButton(
                  onPressed: () {
                    
                  },
                  image: Assets.imagesApplIcon,
                   title: 'تسجيل بواسطة أبل',
                ),
                verticalSpace(16),
                 SocialLoginButton(
                  onPressed: () {
                    
                  },
                  image: Assets.imagesFacebookIcon,
                  title: 'تسجيل بواسطة فيسبوك',
                ),
            ],
          ),
        ),
      ),
    );
  }
}
