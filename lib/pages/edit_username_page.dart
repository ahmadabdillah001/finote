import 'package:finote/bloc/user_bloc.dart';
import 'package:finote/model/user_model.dart';
import 'package:finote/shared/shared.dart';
import 'package:finote/shared/theme.dart';
import 'package:finote/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditUsernamePage extends StatelessWidget {
  const EditUsernamePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController newUsernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    // TextEditingController passwordConfirmController = TextEditingController();
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
              isPassword: true,
            ),
            SpaceHeight(10),
            Text(
              "Enter your password to confirm it's you",
              style: linkTextStyle.copyWith(color: whiteColor.withAlpha(150)),
            ),
            SpaceHeight(30),
            BlocConsumer<UserBloc, UserState>(
              listener: (context, state) {
                if (state is UpdateUserSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Username Updated')),
                  );
                  Navigator.pop(context);
                } else if (state is FailedUserState) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('Failed to load data')));
                }
              },
              builder: (context, state) {
                if (state is LoadingUserState) {
                  return Container(
                    decoration: BoxDecoration(color: primaryColor),
                    child: Center(
                      child: CircularProgressIndicator(color: secondaryColor),
                    ),
                  );
                }
                return CustomButtonWidget(
                  title: 'Change Username',
                  width: double.infinity,
                  onPressed: () {
                    final data = UserModel(
                      name: newUsernameController.text,
                      validatePassword: passwordController.text,
                    );

                    context.read<UserBloc>().add(UpdateCurrentUsernameEvent(data));
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
