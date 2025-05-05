import 'package:flutter/material.dart';
import 'package:fruit_hub/core/widgets/notification_widget.dart';
import '../utils/app_text_styles.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final bool showBackButton;
  final bool showNotification;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
    this.showNotification = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      actions: [
        Visibility(
          visible: showNotification,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: NotificationWidget(),
          ),
        ),
      ],
      leading: Visibility(
        visible: showBackButton,
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
      ),
      centerTitle: true,
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyles.bold19,
      ),
    );
  }
}