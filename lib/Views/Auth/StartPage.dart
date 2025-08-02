// lib/Views/StartPage.dart
import 'package:flutter/material.dart';
import 'package:nampy_frontend/Components/NPButton.dart';
import 'package:nampy_frontend/Views/Global/Theme.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  // One master gap keeps all vertical spacing consistent
  static const double _gap = 24.0;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                // ─── Placeholder "logo" block ────────────────────
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: _gap, bottom: 5),
                      child: SizedBox(
                        height: 70,
                        width: 160,
                        child: Center(
                          child: Text(
                            'Nam.Py',
                            style: Theme.of(context).textTheme.titleLarge,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    // Tagline text below the placeholder
                    Text(
                      'Learning Through Curiosity !!',
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),

                const SizedBox(height: _gap * 20),

                // ─── New User button ─────────────────────────────
                Column(
                  children: [
                    NPButton(
                      color: AppColors.primary,
                      label: 'New User',
                      onPressed: () {
                        // Navigate to SignupPage
                        Navigator.pushReplacementNamed(context, '/signup');
                        // Your action here
                      },
                    ),

                    const SizedBox(height: _gap / 2),

                    // Divider with equal padding top & bottom
                    Divider(thickness: 1.2, color: colors.outlineVariant),

                    const SizedBox(height: _gap / 2),

                    // ─── Existing User button ───────────────────────
                    NPButton(
                      color: AppColors.primary,
                      label: 'Exisiting User',
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/login');
                        // Your action here
                      },
                    ),
                  ],
                ),

                const SizedBox(height: _gap), // bottom space
              ],
            ),
          ),
        ),
      ),
    );
  }
}
