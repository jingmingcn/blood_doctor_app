import 'package:doctor/blocs/auth/auth_bloc.dart';
import 'package:doctor/constants.dart';
import 'package:doctor/screens/auth/sign_in_screen.dart';
import 'package:doctor/screens/auth/sign_up_screen.dart';
import 'package:doctor/screens/login/login_screen.dart';
import 'package:doctor/screens/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: [
              SvgPicture.asset(
                "assets/icons/splash_bg.svg",
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Column(
                    children: [
                      Spacer(),
                      //SvgPicture.asset("assets/icons/gerda_logo.svg"),
                      Text(
                        "血液病智能诊断系统",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Color.fromRGBO(255, 255, 255, 1)),
                      ),
                      Spacer(),
                      ElevatedButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              // builder: (context) => SignUpScreen(),
                              builder: (context) => RegisterScreen(),
                            )),
                        style: TextButton.styleFrom(
                          minimumSize: Size(double.infinity, 0),
                          backgroundColor: Color(0xFF6CD8D1),
                        ),
                        child: Text("注册"),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: defaultPadding),
                        child: ElevatedButton(
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              // builder: (context) => SignInScreen(),
                              builder: (context) => LoginScreen(),
                            ),
                          ),
                          style: TextButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Color(0xFF6CD8D1),
                              ),
                            ),
                            minimumSize: Size(double.infinity, 0),
                            backgroundColor: Colors.transparent,
                          ),
                          child: Text("登录"),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
