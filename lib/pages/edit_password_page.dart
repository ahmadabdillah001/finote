import 'package:finote/shared/shared.dart';
import 'package:finote/widgets/widget.dart';
import 'package:flutter/material.dart';

class EditPasswordPage extends StatelessWidget {
  const EditPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController newUsernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController passwordConfirmController = TextEditingController();
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        toolbarHeight: 75,
        title: Text('Edit Password', style: navTextStyle),
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
              label: 'Current Password',
              hint: 'password',
            ),
            SpaceHeight(15),
            InputFormWidget(
              controller: passwordController,
              label: 'New Password',
              hint: 'password',
            ),
            SpaceHeight(15),
            InputFormWidget(
              controller: passwordConfirmController,
              label: 'Confirm New Password',
              hint: 'password',
            ),
            SpaceHeight(30),
            CustomButtonWidget(
              title: 'Change Password',
              width: double.infinity,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
