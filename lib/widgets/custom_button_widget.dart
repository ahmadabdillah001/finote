import 'package:finote/shared/shared.dart';
import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double width;
  const CustomButtonWidget({
    super.key,
    required this.title,
    required this.onPressed,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: secondaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        minimumSize: Size(width, 50),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Text(title, style: buttonTextStyle),
      ),
    );
  }
}
