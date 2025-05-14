import 'package:finote/bloc/login_bloc.dart';
import 'package:finote/bloc/register_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finote/pages/pages.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LoginBloc()),
        BlocProvider(create: (_) => RegisterBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Finance Note App',
        routes: {
          '/': (context) => const SplashScreen(),
          '/login-register': (context) => const LoginRegisterPage(),
          '/main': (context) => const MainPage(),
          '/home': (context) => const HomePage(),
          '/account': (context) => const AccountPage(),
          '/edit-username': (context) => const EditUsernamePage(),
          '/edit-password': (context) => const EditPasswordPage(),
        },
      ),
    );
  }
}
