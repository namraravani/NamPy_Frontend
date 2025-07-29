import 'package:flutter/material.dart';
import 'package:nampy_frontend/Views/Auth/LoginPage.dart';
import 'package:nampy_frontend/Views/Auth/SignupPage.dart';
import 'package:nampy_frontend/Views/Auth/StartPage.dart';
import 'package:nampy_frontend/Views/FOISelectionPage.dart';
import 'package:nampy_frontend/Views/Global/AppRoutes.dart';
import 'package:nampy_frontend/Views/Global/Theme.dart';
import 'package:nampy_frontend/Views/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
