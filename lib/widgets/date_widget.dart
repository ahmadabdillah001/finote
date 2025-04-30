import 'package:finote/shared/shared.dart';
import 'package:flutter/material.dart';

class DateWidget extends StatelessWidget {
  final String day;
  final int date;
  final bool isActive;
  const DateWidget({
    super.key,
    required this.day,
    required this.date,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isActive ? primaryColor : lightenSecondaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              day,
              style: subTitleListTextStyle.copyWith(
                color: isActive ? whiteColor : primaryColor,
                fontWeight: bold
              ),
            ),
            SpaceHeight(5),
            Text(
              date.toString(),
              style: navTextStyle.copyWith(
                color: isActive ? whiteColor : primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
