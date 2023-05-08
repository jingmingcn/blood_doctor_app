import 'package:doctor/constants.dart';
import 'package:doctor/screens/settings/settings_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              borderRadius:
                  const BorderRadius.all(Radius.circular(defaultPadding / 2)),
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
                    initialValue: "张三",
                    decoration: inputDecoration.copyWith(hintText: "姓名"),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: defaultPadding),
                    child: TextFormField(
                      initialValue: "test@mail.com",
                      decoration: inputDecoration.copyWith(hintText: "Email"),
                    ),
                  ),
                  TextFormField(
                    initialValue: "18612345678",
                    decoration: inputDecoration.copyWith(hintText: "手机号码"),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: defaultPadding),
                    child: TextFormField(
                      initialValue: "长清大学路",
                      decoration: inputDecoration.copyWith(hintText: "地址"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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
