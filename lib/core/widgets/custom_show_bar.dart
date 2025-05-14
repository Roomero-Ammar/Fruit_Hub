
import 'package:flutter/material.dart';

class CustomShowBar extends StatelessWidget {
  final String message;

  const CustomShowBar({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 1),
      content: Text(message),
    );
  }

}
