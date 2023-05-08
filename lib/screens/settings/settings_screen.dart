import 'package:doctor/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/setting_item_caed.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("设置"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: defaultPadding),
              SettingTab(
                text: "消息通知",
                iconSrc: "assets/icons/Notificatio_box.svg",
                value: true,
                onChanged: (value) {},
              ),
              SettingTab(
                text: "消息选项",
                iconSrc: "assets/icons/Chat_box.svg",
                value: false,
                onChanged: (value) {},
              ),
              SettingTab(
                text: "视频通话选项",
                iconSrc: "assets/icons/Video_box.svg",
                value: false,
                onChanged: (value) {},
              ),
              SettingTab(
                text: "通话选项",
                iconSrc: "assets/icons/Call_box.svg",
                value: true,
                onChanged: (value) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
