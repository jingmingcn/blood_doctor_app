import 'package:doctor/blocs/auth/auth_bloc.dart';
import 'package:doctor/constants.dart';
import 'package:doctor/screens/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("账户"),
            actions: [
              IconButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsScreen(),
                  ),
                ),
                icon: Icon(
                  Icons.settings,
                  color: primaryColor,
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(defaultPadding),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(
                      Radius.circular(defaultPadding / 2)),
                  child: Image.asset(
                    "assets/images/user_pic.png",
                    height: 120,
                    width: 120,
                  ),
                ),
                SizedBox(height: defaultPadding),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        initialValue: (state is AuthAuthenticatedState)
                            ? state.user.username
                            : '',
                        decoration: inputDecoration.copyWith(hintText: "用户名"),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: defaultPadding),
                        child: TextFormField(
                          initialValue: (state is AuthAuthenticatedState)
                              ? state.user.email
                              : '',
                          decoration:
                              inputDecoration.copyWith(hintText: "Email"),
                        ),
                      ),
                      TextFormField(
                        initialValue: (state is AuthAuthenticatedState)
                            ? state.user.cellphone
                            : '',
                        decoration: inputDecoration.copyWith(hintText: "手机号码"),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: defaultPadding),
                        child: TextFormField(
                          initialValue: "长清大学路",
                          decoration: inputDecoration.copyWith(hintText: "地址"),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () =>
                            context.read<AuthBloc>().add(AuthLogoutEvent()),
                        child: Text("退出账户"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

const InputDecoration inputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  border: OutlineInputBorder(borderSide: BorderSide.none),
  enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
  focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
);
