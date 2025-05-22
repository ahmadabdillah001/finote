import 'package:finote/bloc/login_bloc.dart';
import 'package:finote/model/login_request_model.dart';
import 'package:finote/shared/shared.dart';
import 'package:finote/utils/session_manager.dart';
import 'package:finote/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
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
        BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              directToHomePage();
            } else if (state is LoginFailed) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Login Failed')));
            }
          },
          builder: (context, state) {
            if (state is LoginLoading) {
              return Center(
                child: CircularProgressIndicator(color: secondaryColor),
              );
            }
            return CustomButtonWidget(
              title: 'Login',
              onPressed: () {
                final requestBody = LoginRequestModel(
                  email: email.text,
                  password: password.text,
                );
                context.read<LoginBloc>().add(Login(requestBody));
              },
            );
          },
        ),
      ],
    );
  }
}
