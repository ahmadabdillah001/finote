import 'package:finote/shared/shared.dart';
import 'package:finote/widgets/widget.dart';
import 'package:flutter/material.dart';

class LoginWidget extends StatelessWidget {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        InputFormWidget(
          controller: email,
          label: 'Email',
          hint: '@example.com',
        ),
        SpaceHeight(20),
        InputFormWidget(
          controller: password,
          label: 'Password',
          hint: 'password',
          isPassword: true,
        ),
        SpaceHeight(35),
        CustomButtonWidget(
          title: 'Login',
          onPressed: () {
            Navigator.pushNamed(context, '/main');
          },
        ),
      ],
    );
  }
}
