import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/constants/constants.dart';
import 'package:fruit_hub/core/helper_functions/spacing.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/features/on_boarding/presentation/view/widgets/on_boarding_page_view.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // يمكنك تحديد ارتفاع هنا
          SizedBox(
            height: 650.h, // تحديد ارتفاع مناسب
            child: OnBoardingPageView(),
          ),
          // Expanded(child: OnBoardingPageView()), and remove SingleChildScrollView >> If you want the page not scroll
          DotsIndicator(
            dotsCount: 2,
            decorator: DotsDecorator(
              activeColor: AppColors.primaryColor,
              color: AppColors.primaryColor.withValues(alpha: 0.5),
              ),
          ),
          verticalSpace(29),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: kHorizintalPadding.h),
            child: CustomButton(onPressed: (){},text: "ابدأ الأن",),
          ),
          verticalSpace(43),
        ],
      ),
    );
  }
}
