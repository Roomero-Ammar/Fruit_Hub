import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/helper_functions/routes.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'dart:async';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    excuteNaviagtion(); // Call directly as you requested
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(Assets.imagesPlant),
          ],
        ),
        SvgPicture.asset(Assets.imagesLogo),
        SvgPicture.asset(
          Assets.imagesSplashBottom,
          fit: BoxFit.fill,
        ),
      ],
    );
  }

  void excuteNaviagtion() {
    // Use Future.delayed to handle the navigation delay
    Future.delayed(const Duration(seconds: 2), () {
      // Check if the widget is still mounted to prevent errors
      if (mounted) {
        Navigator.pushReplacementNamed(context, Routes.OnBoardingView);
      }
    });
  }
}