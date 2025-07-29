import 'package:flutter/material.dart';
import 'package:nampy_frontend/Components/NPButton.dart';
import 'package:nampy_frontend/Components/NPInputField.dart';
import 'package:nampy_frontend/Validators/Validator.dart';

class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  int _currentStep = 0;
  String? _selectedOption;

  // Controllers for form data
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _bioController = TextEditingController();

  void _nextStep() {
    if (_formKey.currentState!.validate()) {
      if (_currentStep < 2) {
        setState(() {
          _currentStep++;
        });
      } else {
        _submitForm(); // Final submission
      }
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      print("All Form Data:");
      print("First Name: ${_firstNameController.text}");
      print("Last Name: ${_lastNameController.text}");
      print("Username: ${_usernameController.text}");
      print("Email: ${_emailController.text}");
      print("Password: ${_passwordController.text}");
      print("Bio: ${_bioController.text}");

      // TODO: Submit form to backend
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildProgressBar((_currentStep + 1) / 3),
                  const SizedBox(height: 20),
                  headerText(
                    context,
                    stepHeader1[_currentStep],
                    stepHeader2[_currentStep],
                  ),
                  const SizedBox(height: 30),
                  ..._buildStepFields(),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 140,
                        child: NPButton(
                          label: _currentStep == 2 ? 'Submit' : 'Next',
                          icon: _currentStep == 2
                              ? Icons.check
                              : Icons.arrow_forward,
                          onPressed: _nextStep,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildStepFields() {
    switch (_currentStep) {
      case 0:
        return [
          NPInputField(
            labelText: 'First Name',
            controller: _firstNameController,
            placeholder: 'Enter your First Name',
            validator: Validator.validateField,
          ),
          const SizedBox(height: 20),
          NPInputField(
            labelText: 'Last Name',
            controller: _lastNameController,
            placeholder: 'Enter your last Name',
            validator: Validator.validateField,
          ),
          const SizedBox(height: 20),
          NPInputField(
            labelText: 'username',
            controller: _usernameController,
            placeholder: 'Enter your Username',
            validator: Validator.validateUsername,
          ),
        ];
      case 1:
        return [
          NPInputField(
            labelText: 'Email',
            controller: _emailController,
            placeholder: 'Enter your Email',
            validator: Validator.validateEmail,
          ),
          const SizedBox(height: 20),
          NPInputField(
            labelText: 'Password',
            controller: _passwordController,
            placeholder: 'Enter your Password',
            validator: Validator.validatePassword,
          ),
          const SizedBox(height: 20),
          NPInputField(
            labelText: 'Confirm Password',
            controller: _passwordController,
            placeholder: 'Enter your Password',
            validator: Validator.validatePassword,
          ),
        ];
      case 2:
        return [
          DropdownButtonFormField<String>(
            value: _selectedOption,
            decoration: InputDecoration(
              labelText: 'Select Designation',
              border: OutlineInputBorder(),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 14, horizontal: 12),
            ),
            items: [
              'Student',
              'Professional',
              'Freelancer',
              'Entrepreneur',
            ].map((option) {
              return DropdownMenuItem(
                value: option,
                child: Text(option),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedOption = value;
              });
            },
            validator: Validator.validateField, // Optional: same as used before
          ),
        ];
      default:
        return [];
    }
  }
}

final List<String> stepHeader1 = [
  "Welcome learner, create your account in just 3 easy steps!",
  "You're halfway there!",
  "Almost done!",
];

final List<String> stepHeader2 = [
  "Tell us a bit about yourself!",
  "Account security details",
  "Add a small intro to complete!",
];

Widget buildProgressBar(double value) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 24),
    height: 20,
    decoration: BoxDecoration(
      color: Colors.grey.shade300,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade200,
          blurRadius: 6,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: LinearProgressIndicator(
        value: value,
        backgroundColor: Colors.transparent,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
        minHeight: 20,
      ),
    ),
  );
}

Widget headerText(BuildContext context, String text1, String text2) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(text1, style: Theme.of(context).textTheme.bodyMedium),
      const SizedBox(height: 8),
      Text(text2, style: Theme.of(context).textTheme.titleLarge),
    ],
  );
}

// Widget inputField(String label, TextEditingController controller,
//     String? Function(String?) validator,
//     {bool obscure = false}) {
//   return TextFormField(
//     controller: controller,
//     obscureText: obscure,
//     decoration: InputDecoration(
//       labelText: label,
//       border: const OutlineInputBorder(),
//       contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
//     ),
//     validator: validator,
//   );
// }
