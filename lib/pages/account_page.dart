import 'package:finote/bloc/user_bloc.dart';
import 'package:finote/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(GetCurrentUserEvent());
  }

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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is LoadingUserState) {
          return Container(
            decoration: BoxDecoration(color: primaryColor),
            child: Center(
              child: CircularProgressIndicator(color: secondaryColor),
            ),
          );
        } else if (state is GetUserSuccess) {
          final data = state.responseBody;
          final username = data.name!;
          final email = maskEmail(data.email!);
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
                                  Navigator.pushNamed(
                                    context,
                                    '/edit-username',
                                  );
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
                                '********',
                                style: linkTextStyle.copyWith(
                                  fontWeight: regular,
                                  color: whiteColor.withAlpha(100),
                                ),
                              ),
                              GestureDetector(
                                onTap:
                                    () => Navigator.pushNamed(
                                      context,
                                      '/edit-password',
                                    ),
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
        } else if (state is FailedUserState) {
          return Container(
            decoration: BoxDecoration(color: primaryColor),
            child: Center(child: Text('Failed to load data', style: subTitleListTextStyle)),
          );
        }
        return Container();
      },
    );
  }
}
