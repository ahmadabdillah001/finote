import 'package:finote/bloc/register_bloc.dart';
import 'package:finote/model/register_model.dart';
import 'package:finote/shared/shared.dart';
import 'package:finote/utils/session_manager.dart';
import 'package:finote/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({super.key});

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  TextEditingController username = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  final sesionManager = SessionManager();

  void directToHomePage() {
    Navigator.pushReplacementNamed(context, '/main');
  }

  void checkAccessToken() async {
    final accessToken = await sesionManager.getAccessToken();
    if (accessToken.isNotEmpty) {
      directToHomePage();
    }
  }

  @override
  void initState() {
    checkAccessToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        InputFormWidget(
          controller: username,
          label: 'Username',
          hint: 'username',
        ),
        SpaceHeight(20),
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
        BlocConsumer<RegisterBloc, RegisterState>(
          listener: (context, state) {
            if (state is RegisterSuccess) {
              directToHomePage();
            } else if (state is RegisterFailed) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Register Failed')));
            }
          },
          builder: (context, state) {
            if (state is RegisterLoading) {
              return const CircularProgressIndicator();
            }
            return CustomButtonWidget(
              title: 'Register',
              onPressed: () {
                final requestBody = RegisterModel(
                  email: email.text,
                  name: username.text,
                  password: password.text,
                );
                context.read<RegisterBloc>().add(Register(requestBody));
              },
            );
          },
        ),
      ],
    );
  }
}
