import 'package:finote/shared/shared.dart';
import 'package:finote/shared/theme.dart';
import 'package:finote/widgets/widget.dart';
import 'package:flutter/material.dart';

class EditUsernamePage extends StatelessWidget {
  const EditUsernamePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController newUsernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController passwordConfirmController = TextEditingController();
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        toolbarHeight: 75,
        title: Text('Edit Username', style: navTextStyle),
        backgroundColor: secondaryColor,
        leading: null,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            SpaceHeight(15),
            InputFormWidget(
              controller: newUsernameController,
              label: 'New Username',
              hint: 'username',
            ),
            SpaceHeight(15),
            InputFormWidget(
              controller: passwordController,
              label: 'Password',
              hint: 'password',
            ),
            SpaceHeight(10),
            Text("Enter your password to confirm it's you", style: linkTextStyle.copyWith(color: whiteColor.withAlpha(150))),
            SpaceHeight(30),
            CustomButtonWidget(
              title: 'Change Username',
              width: double.infinity,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}