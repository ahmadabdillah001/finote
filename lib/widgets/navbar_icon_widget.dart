import 'package:finote/shared/shared.dart';
import 'package:flutter/material.dart';

class NavbarIconWidget extends StatelessWidget {
  final IconData iconData;
  final String title;
  final bool isActive;
  final VoidCallback onTap;
  const NavbarIconWidget({
    super.key,
    required this.iconData,
    required this.title,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Icon(iconData, size: 35, color: isActive ? secondaryColor : whiteColor),
          SpaceHeight(4),
          Text(
            title,
            style: bottomBarTextStyle.copyWith(
              color: isActive ? secondaryColor : whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
