import 'package:doctor/constants.dart';
import 'package:doctor/screens/home/home_screen.dart';
import 'package:doctor/screens/main/main_screen.dart';
import 'package:flutter/material.dart';

import 'cpmponents/calendar.dart';
import 'my_appointment_screen.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({Key? key}) : super(key: key);

  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  final List<String> sloats = [
    "上午 10:10",
    "上午 10:30",
    "上午 10:50",
    "下午 2:10",
    "下午 2:50",
  ];

  int selectedSloats = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("预约"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Calendar(),
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Text(
              "时间",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: 5,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2.77,
                mainAxisSpacing: defaultPadding,
                crossAxisSpacing: defaultPadding,
              ),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  setState(() {
                    selectedSloats = index;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color:
                        selectedSloats == index ? primaryColor : Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  child: Text(
                    sloats[index],
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        color:
                            selectedSloats == index ? Colors.white : textColor),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyAppointmentScreen(),
                ),
              ),
              child: Text("预约"),
            ),
          ),
        ],
      ),
    );
  }
}