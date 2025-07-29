import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nampy_frontend/Components/Header.dart';
import 'package:nampy_frontend/Views/Auth/StartPage.dart';
import 'package:nampy_frontend/Views/Global/Theme.dart'; // Replace with your actual home page

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Delay and then navigate
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/start');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary, // Optional background color
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Header(), // Your title + tagline widget
          ],
        ),
      ),
    );
  }
}
