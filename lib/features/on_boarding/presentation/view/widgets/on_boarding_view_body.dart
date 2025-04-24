import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/helper_functions/spacing.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
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
            height: 700.h, // تحديد ارتفاع مناسب
            child: OnBoardingPageView(),
          ),
          DotsIndicator(
            dotsCount: 2,
            decorator: DotsDecorator(
              activeColor: AppColors.primaryColor,
              color: AppColors.primaryColor.withValues(alpha: 0.5),
              ),
          ),
          verticalSpace(10),
          Center(child: Text('OnBoarding View Body')),
        ],
      ),
    );
  }
}
