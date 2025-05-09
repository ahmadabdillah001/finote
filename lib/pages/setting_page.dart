import 'package:finote/shared/shared.dart';
import 'package:finote/widgets/widget.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        toolbarHeight: 75,
        automaticallyImplyLeading: false,
        title: Text('Setting', style: navTextStyle),
        backgroundColor: secondaryColor,
        leading: null,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/account');
              },
              child: Card(
                color: lightenPrimaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Icon(Icons.person, size: 40, color: whiteColor),
                      SpaceWidth(15),
                      Text('Account', style: titleListTextStyle),
                    ],
                  ),
                ),
              ),
            ),
            SpaceHeight(10),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => LogoutDialog(),
                );
              },
              child: Card(
                color: lightenPrimaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Icon(Icons.logout_outlined, size: 40, color: whiteColor),
                      SpaceWidth(15),
                      Text('Log Out', style: titleListTextStyle),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
