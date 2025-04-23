import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';
class PageViewItem extends StatelessWidget {
  const PageViewItem(
      {super.key,
      required this.image,
      required this.backgroundImage,
      required this.subtitle,
      required this.title, 
      required this.controller,
     });

  final String image, backgroundImage;
  final String subtitle;
  final Widget title;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  backgroundImage,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SvgPicture.asset(
                  image,
                ),
              ),
          Positioned(
  top: 30.h,
  right: 16.w,
  child: GestureDetector(
    onTap: () {
      controller.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    },
    child: Text(
      'تخطى',
      style: TextStyles.regular16.copyWith(
        color: const Color(0xFF949D9E),
      ),
    ),
  ),
),  ],
          ),
        ),
         SizedBox(
          height: 64.h,
        ),
        title,
         SizedBox(
          height: 24.h,
        ),
        Padding(
          padding:  EdgeInsets.symmetric(
            horizontal: 37.h,
          ),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyles.semiBold13.copyWith(
              color: const Color(0xFF4E5456),
            ),
          ),
        )
      ],
    );
  }
}