import 'package:flutter/material.dart';
import 'package:nampy_frontend/Components/NPButton.dart';
import 'package:nampy_frontend/Components/NPInputField.dart';
import 'package:nampy_frontend/Validators/Validator.dart';
import 'package:nampy_frontend/Views/Global/Theme.dart';
import 'package:searchfield/searchfield.dart';

class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  int _currentStep = 0;
  String? _selectedDesignation;
  final List<String> _allFields = [
    'Computer Science',
    'Data Science',
    'Machine Learning',
    'Artificial Intelligence',
  ];
  bool _hasInitializedDropdown = false;
  List<String> _availableFields = [];
  List<String> _selectedFields = [];

  double _progressValue = (1 / 3) - 0.1; // Start with 1/3 progress
  // Controllers for form data
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();

  void _nextStep() {
    if (_formKey.currentState!.validate()) {
      if (_currentStep < 2) {
        setState(() {
          _currentStep++;
          _progressValue = ((_currentStep + 1) / 3) - 0.1;
        });

        if (_currentStep == 2 && !_hasInitializedDropdown) {
          _availableFields = List.from(_allFields);
          _selectedFields.clear();
          _hasInitializedDropdown = true;
        }
      }
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
        _progressValue = ((_currentStep + 1) / 3) - 0.1;
      });
    }
  }

  void _onFieldSelected(String value) {
    if (_availableFields.contains(value)) {
      setState(() {
        _selectedFields.add(value);
        _availableFields.remove(value);
      });
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
      print("Designation: ${_selectedDesignation}");

      Navigator.of(context).pushNamed('/dashboard');
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
                  /// 🎯 Animated Progress Bar
                  TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0, end: _progressValue),
                    duration: const Duration(milliseconds: 500),
                    builder: (context, value, _) {
                      return buildProgressBar(context, value);
                    },
                  ),
                  const SizedBox(height: 20),

                  /// 🎯 Animated Header Text
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (child, animation) {
                      return SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(1, 0),
                          end: Offset.zero,
                        ).animate(animation),
                        child: FadeTransition(opacity: animation, child: child),
                      );
                    },
                    child: headerText(
                      context,
                      stepHeader1[_currentStep],
                      stepHeader2[_currentStep],
                      key: ValueKey(_currentStep),
                    ),
                  ),

                  const SizedBox(height: 30),

                  /// 🎯 Animated Fields
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 400),
                    transitionBuilder: (child, animation) {
                      return SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(1, 0),
                          end: Offset.zero,
                        ).animate(animation),
                        child: FadeTransition(opacity: animation, child: child),
                      );
                    },
                    child: Column(
                      key: ValueKey(_currentStep),
                      children: _buildStepFields(),
                    ),
                  ),

                  const SizedBox(height: 30),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (_currentStep > 0)
                        SizedBox(
                          width: 140,
                          child: NPButton(
                            color: AppColors.danger,
                            label: 'Previous',
                            icon: Icons.arrow_back,
                            onPressed: _previousStep,
                          ),
                        )
                      else
                        const SizedBox(
                            width:
                                140), // Empty space to align "Next" to the right

                      SizedBox(
                        width: 140,
                        child: NPButton(
                          color: AppColors.primary,
                          label: _currentStep == 2 ? 'Submit' : 'Next',
                          icon: _currentStep == 2
                              ? Icons.check
                              : Icons.arrow_forward,
                          onPressed:
                              _currentStep == 2 ? _submitForm : _nextStep,
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
            controller: _confirmpasswordController,
            placeholder: 'Enter your Password',
            validator: (value) => Validator.validateConfirmPassword(
              _passwordController.text,
              value,
            ),
          ),
        ];
      case 2:
        return [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text("Select a Field of Interest"),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 16),
                        child: Theme(
                          data: Theme.of(context).copyWith(
                            inputDecorationTheme: InputDecorationTheme(
                              hintStyle: const TextStyle(color: Colors.grey),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 14),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.primary),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: AppColors.secondary, width: 2),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          child: SearchField<String>(
                            hint: 'Search Field of Interest',
                            suggestions: _availableFields
                                .map((field) =>
                                    SearchFieldListItem<String>(field))
                                .toList(),
                            onSuggestionTap:
                                (SearchFieldListItem<String> item) {
                              _onFieldSelected(item.searchKey);
                            },
                          ),
                        ),
                      ),

                      // Display selected fields below the dropdown
                      if (_selectedFields.isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding:
                                  EdgeInsets.only(top: 20, bottom: 8, left: 4),
                              child: Text(
                                "Selected Fields:",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: _selectedFields
                                  .map(
                                    (field) => Chip(
                                      label: Text(field),
                                      backgroundColor: AppColors.primary,
                                      deleteIcon: const Icon(Icons.close,
                                          color: Colors.white, size: 18),
                                      onDeleted: () {
                                        setState(() {
                                          _selectedFields.remove(field);
                                          _availableFields.add(field);
                                        });
                                      },
                                      labelStyle:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ];
      default:
        return [];
    }
  }
}

final List<String> stepHeader1 = [
  "Welcome learner, create your account in just 3 easy steps!",
  "You're almost there!",
  "Just a little bit of information to complete your profile!",
];

final List<String> stepHeader2 = [
  "Tell us a bit about yourself!",
  "Account security details",
  "Add a small intro to complete!",
];

Widget buildProgressBar(BuildContext context, double value) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 24),
    height: 20,
    decoration: BoxDecoration(
      color: AppColors.secondary,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: AppColors.secondary,
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
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
        minHeight: 20,
      ),
    ),
  );
}

Widget headerText(BuildContext context, String text1, String text2,
    {Key? key}) {
  return Column(
    key: key,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(text1, style: Theme.of(context).textTheme.bodyMedium),
      const SizedBox(height: 8),
      Text(text2, style: Theme.of(context).textTheme.titleLarge),
    ],
  );
}
