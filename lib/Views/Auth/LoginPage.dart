import 'package:flutter/material.dart';
import 'package:nampy_frontend/Components/Header.dart';
import 'package:nampy_frontend/Components/NPInputField.dart';

import 'package:nampy_frontend/Validators/Validator.dart';
import 'package:nampy_frontend/Views/Global/Theme.dart';
import 'package:nampy_frontend/Components/NPButton.dart';
import 'package:nampy_frontend/models/LoginModel.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final LoginModel _loginData = LoginModel();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
  }

  bool _obscurePassword = true;

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
                'Login',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 10),
              Text(
                'Welcome back ! Learner Please Enter Your Credentials ',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      NPInputField(
                        labelText: 'Email',
                        controller: _emailController,
                        placeholder: 'Enter your Email',
                        validator: Validator.validateEmail,
                      ),
                      const SizedBox(height: 20),
                      NPInputField(
                        labelText: 'Password',
                        controller: _emailController,
                        placeholder: 'Enter your Password',
                        validator: Validator.validatePassword,
                      ),
                      const SizedBox(height: 30),
                      NPButton(
                        label: 'Login',
                        onPressed: () {
                          _submitForm();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
