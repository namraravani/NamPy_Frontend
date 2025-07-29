import 'package:flutter/material.dart';
import 'package:nampy_frontend/Views/Global/Theme.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24.0, bottom: 5),
          child: SizedBox(
            height: 70,
            width: 160,
            child: Center(
              child: Text(
                'Nam.Py',
                style: TextStyle(
                  fontFamily: 'NPFont',
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                  letterSpacing: 2,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Text(
          'Learning Through Curiosity !!',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
