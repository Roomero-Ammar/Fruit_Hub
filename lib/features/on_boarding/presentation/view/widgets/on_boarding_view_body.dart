import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/constants/constants.dart';
import 'package:fruit_hub/core/helper_functions/extentsions.dart';
import 'package:fruit_hub/core/helper_functions/spacing.dart';
import 'package:fruit_hub/core/services/shared_preferences_singleton.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/features/on_boarding/presentation/view/widgets/on_boarding_page_view.dart';

import '../../../../../core/Routing/routes.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;
  var currerntPage = 0;
  @override
  void initState() {
    pageController = PageController();

    pageController.addListener(() {
      currerntPage = pageController.page!.round();
      setState(() {
        // TO Update the Ui
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // يمكنك تحديد ارتفاع هنا
          SizedBox(
            height: 650.h, // تحديد ارتفاع مناسب
            child: OnBoardingPageView(pageController: pageController),
          ),
          // Expanded(child: OnBoardingPageView()), and remove SingleChildScrollView >> If you want the page not scroll
          DotsIndicator(
            dotsCount: 2,
            decorator: DotsDecorator(
              activeColor: AppColors.primaryColor,
              color:
                  currerntPage == 1
                      ? AppColors.primaryColor
                      : AppColors.primaryColor.withValues(alpha: 0.5),
            ),
          ),
          verticalSpace(29),
          Visibility(
            visible: currerntPage == 1 ? true : false,
            maintainSize: true,
            maintainState: true,
            maintainAnimation: true,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: kHorizintalPadding.h),
              child: CustomButton(
                onPressed: () {
                  // Check if onBoarding is seen or not
                  Prefs.setBool(kIsOnBoardingViewSeen, true);
                  // Navigate to LoginView
                  context.pushNamed(Routes.loginView);
                },
                text: "ابدأ الأن",
              ),
            ),
          ),
          verticalSpace(43),
        ],
      ),
    );
  }
}
