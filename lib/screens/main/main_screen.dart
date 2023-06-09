import 'package:doctor/Noti.dart';
import 'package:doctor/screens/appointment/my_appointment_screen.dart';
import 'package:doctor/screens/doctors/doctors_screen.dart';
import 'package:doctor/screens/home/home_screen.dart';
import 'package:doctor/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../constants.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> _pages = [
    HomePage(),
    DoctorsScreen(),
    MyAppointmentScreen(),
    ProfileScreen(),
  ];
  int _selectedPage = 0;

  @override
  void initState() {
    super.initState();
    Noti.initialize(flutterLocalNotificationsPlugin);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPage],
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(defaultPadding),
        color: Colors.white,
        child: SafeArea(
          child: GNav(
            haptic: true,
            tabBorderRadius: 15,
            curve: Curves.ease,
            duration: Duration(milliseconds: 350),
            gap: 8,
            color: Colors.grey[800],
            activeColor: Colors.white,
            iconSize: 24,
            tabBackgroundColor: primaryColor,
            padding: EdgeInsets.symmetric(
              horizontal: defaultPadding,
              vertical: defaultPadding / 2,
            ),
            tabs: [
              GButton(
                icon: Icons.home,
                text: '首页',
              ),
              GButton(
                icon: Icons.people,
                text: '医师',
              ),
              GButton(
                icon: Icons.content_paste,
                text: '预约',
              ),
              GButton(
                icon: Icons.person,
                text: '账户',
              )
            ],
            onTabChange: (pageNum) {
              setState(() {
                _selectedPage = pageNum;
              });
            },
          ),
        ),
      ),
    );
  }
}
