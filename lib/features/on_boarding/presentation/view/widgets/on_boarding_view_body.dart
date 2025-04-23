import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/helper_functions/spacing.dart';
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
            height: 800.h, // تحديد ارتفاع مناسب
            child: OnBoardingPageView(),
          ),
          verticalSpace(10),
          Center(child: Text('OnBoarding View Body')),
        ],
      ),
    );
  }
}