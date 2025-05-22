import 'package:finote/bloc/user_bloc.dart';
import 'package:finote/model/user_model.dart';
import 'package:finote/shared/shared.dart';
import 'package:finote/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditPasswordPage extends StatelessWidget {
  const EditPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController currentPasswordController = TextEditingController();
    TextEditingController newPasswordController = TextEditingController();
    TextEditingController confirmNewPasswordController =
        TextEditingController();
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
              controller: currentPasswordController,
              label: 'Current Password',
              hint: 'password',
              isPassword: true,
            ),
            SpaceHeight(15),
            InputFormWidget(
              controller: newPasswordController,
              label: 'New Password',
              hint: 'password',
              isPassword: true,
            ),
            SpaceHeight(15),
            InputFormWidget(
              controller: confirmNewPasswordController,
              label: 'Confirm New Password',
              hint: 'password',
              isPassword: true,
            ),
            SpaceHeight(30),
            BlocConsumer<UserBloc, UserState>(
              listener: (context, state) {
                if (state is UpdateUserSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Password Updated')),
                  );
                  Navigator.pop(context);
                } else if (state is FailedUserState) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('Failed to load data')));
                }
              },
              builder: (context, state) {
                return CustomButtonWidget(
                  title: 'Change Password',
                  width: double.infinity,
                  onPressed: () {
                    if (newPasswordController.text !=
                        confirmNewPasswordController.text) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Password confirmation failed'),
                        ),
                      );
                      return;
                    }

                    final data = UserModel(
                      password: newPasswordController.text,
                      validatePassword: currentPasswordController.text,
                    );
                    context.read<UserBloc>().add(UpdateCurrentPasswordEvent(data));
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
