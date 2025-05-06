import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/helper_functions/spacing.dart';
import 'package:fruit_hub/core/widgets/custom_app_bar_widget.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/core/widgets/custom_text_field.dart';
import 'package:fruit_hub/core/widgets/password_field.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/or_divider.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import 'dont_have_an_account_widget.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kHorizintalPadding,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpace(24),
            // CustomAppBar(title: "تسجيل الدخول", showBackButton: true,showNotification: false),
            CustomTextFormField(
              hintText: "البريد الالكتروني",
              textInputType: TextInputType.emailAddress,
            ),
            verticalSpace(16),
            PasswordField(),
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
                CustomButton(onPressed: (){}, text: 'تسجيل دخول'),
                verticalSpace(33),
                const DontHaveAnAccountWidget(),
                verticalSpace(33),
                const OrDivider(),
                verticalSpace(16),
          ],
        ),
      ),
    );
  }
}
