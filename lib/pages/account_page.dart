import 'package:finote/shared/shared.dart';
import 'package:finote/shared/theme.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  String maskEmail(String email) {
    final parts = email.split('@');
    if (parts.length != 2) return email;

    final local = parts[0];
    final domain = parts[1];

    if (local.length <= 2) return '${local[0]}*@$domain';

    final first = local[0];
    final last = local[local.length - 1];
    final middle = '*' * (local.length - 2);

    return '$first$middle$last@$domain';
  }

  String maskPassword(String password) {
    return '*' * password.length;
  }

  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final email = maskEmail('bebaslah@gmail.com');
    final username = 'memet';
    final password = maskPassword('memet123');
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        toolbarHeight: 75,
        title: Text('Account', style: navTextStyle),
        backgroundColor: secondaryColor,
        leading: null,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Card(
              color: lightenPrimaryColor,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('Username', style: titleListTextStyle),
                        Spacer(),
                        Text(
                          username,
                          style: linkTextStyle.copyWith(
                            fontWeight: regular,
                            color: whiteColor.withAlpha(100),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/edit-username');
                          },
                          child: Icon(
                            Icons.keyboard_arrow_right_rounded,
                            size: 30,
                            color: whiteColor.withAlpha(100),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SpaceHeight(10),
            Card(
              color: lightenPrimaryColor,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('Email', style: titleListTextStyle),
                        Spacer(),
                        Text(
                          email,
                          style: linkTextStyle.copyWith(
                            fontWeight: regular,
                            color: whiteColor.withAlpha(100),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SpaceHeight(10),
            Card(
              color: lightenPrimaryColor,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('Password', style: titleListTextStyle),
                        Spacer(),
                        Text(
                          password,
                          style: linkTextStyle.copyWith(
                            fontWeight: regular,
                            color: whiteColor.withAlpha(100),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.pushNamed(context, '/edit-password'),
                          child: Icon(
                            Icons.keyboard_arrow_right_rounded,
                            size: 30,
                            color: whiteColor.withAlpha(100),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
