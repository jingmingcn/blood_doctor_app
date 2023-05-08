import 'package:doctor/constants.dart';
import 'package:flutter/material.dart';

class MyAppointmentScreen extends StatelessWidget {
  const MyAppointmentScreen({Key? key}) : super(key: key);

  static final DateTime _date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的预约"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(defaultPadding),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.all(Radius.circular(defaultPadding / 2)),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: buildAppointmentInfo("日期",
                              "${_date.day}/${_date.month}/${_date.year}"),
                        ),
                        Expanded(
                          child: buildAppointmentInfo("时间", "上午 10:30"),
                        ),
                        Expanded(
                          child: buildAppointmentInfo("医师", "彭军"),
                        ),
                      ],
                    ),
                    Divider(height: defaultPadding * 2),
                    Row(
                      children: [
                        Expanded(
                          child: buildAppointmentInfo(
                            "科室",
                            "血液科",
                          ),
                        ),
                        Expanded(
                          child: buildAppointmentInfo("医院", "齐鲁医院"),
                        ),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            style:
                                TextButton.styleFrom(backgroundColor: redColor),
                            child: Text("取消预约"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column buildAppointmentInfo(String title, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            color: textColor.withOpacity(0.62),
          ),
        ),
        Text(
          text,
          maxLines: 1,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
