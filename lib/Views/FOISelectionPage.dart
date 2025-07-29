import 'package:flutter/material.dart';

// FOI Means Feild of Interest
class FOISelectionPage extends StatefulWidget {
  const FOISelectionPage({super.key});

  @override
  State<FOISelectionPage> createState() => _FOISelectionPageState();
}

class _FOISelectionPageState extends State<FOISelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              Text(
                'Field of Interest',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 10),
              Text(
                'Please select your field of interest to continue',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              // Add your selection widgets here
            ],
          ),
        ),
      ),
    );
  }
}
