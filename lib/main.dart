import 'package:doctor/blocs/auth/auth_bloc.dart';
import 'package:doctor/screens/main/main_screen.dart';
import 'package:doctor/screens/splash/home_screen.dart';
import 'package:doctor/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        title: 'Blood App',
        debugShowCheckedModeBanner: false,
        theme: appTheme(context),
        home: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthLoadingState) {
              return const SplashScreen();
            } else if (state is AuthUnauthenticatedState) {
              return const HomeScreen();
            } else {
              return const MainScreen();
            }
          },
        ),
        // localizationsDelegates: const [
        //   FormBuilderLocalizations.delegate,
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate,
        // ],
        // supportedLocales: const [
        // Locale('cn', ''),
        // Locale('pt', ''),
        // Locale('es', ''),
        // Locale('fa', ''),
        // Locale('fr', ''),
        // Locale('ja', ''),
        // Locale('sk', ''),
        // Locale('pl', ''),
        // ],
      ),
    );
  }
}
