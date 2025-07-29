import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nampy_frontend/Views/Global/Theme.dart';

class NPButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final IconData? icon;

  const NPButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          // Shadow layer for uplifted effect
          Positioned(
            top: 6,
            left: 0,
            right: 0,
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.secondary.withOpacity(0.25),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          // Actual Button
          ElevatedButton(
            onPressed: () {
              HapticFeedback.heavyImpact();
              onPressed();
            },
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(const Size.fromHeight(48)),
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (states) => states.contains(MaterialState.pressed)
                    ? AppColors.secondary
                    : AppColors.primary,
              ),
              foregroundColor: MaterialStateProperty.all(Colors.white),
              elevation: MaterialStateProperty.all(0), // No default elevation
              shadowColor: MaterialStateProperty.all(Colors.transparent),
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: AppColors.secondary,
                    width: 2, // Regular border thickness
                  ),
                  left: BorderSide(
                    color: AppColors.secondary,
                    width: 2,
                  ),
                  right: BorderSide(
                    color: AppColors.secondary,
                    width: 2,
                  ),
                  bottom: BorderSide(
                    color: AppColors.secondary,
                    width: 6, // Thicker bottom border for uplifted effect
                  ),
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3.0,
                      fontSize: 15,
                      fontFamily: 'NPFont',
                    ),
                  ),
                  if (icon != null) ...[
                    Icon(icon, color: Colors.white, size: 25),
                    const SizedBox(width: 8),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
