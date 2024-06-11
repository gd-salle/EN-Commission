import 'package:flutter/material.dart';
import '../widgets/account_type_dropdown.dart';
import '../widgets/top_design.dart';
import '../widgets/bottom_design.dart';
import '../routes/app_routes.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>(); // Key for the form
  String? _username;
  String? _password;
  String? _selectedAccountType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TopDesign(),
              SizedBox(height: 20),
              Image.asset(
                'assets/images/unc_logo.png',
                height: 150,
              ),
              SizedBox(height: 20),
              Text(
                'LOGIN',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Form(
                  key: _formKey, // Assigning the form key
                  child: Column(
                    children: [
                      AccountTypeDropdown(
                        initialValue: _selectedAccountType,
                        onChanged: (value) {
                          setState(() {
                            _selectedAccountType = value;
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Username:'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your username';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _username = value;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(labelText: 'Password:'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _password = value;
                        },
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            // Now you can use _username and _password
                            Navigator.pushNamed(
                                context, AppRoutes.landingPage);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          padding: EdgeInsets.symmetric(
                              horizontal: 100, vertical: 15),
                        ),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Don’t have an existing account?",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 5),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, AppRoutes.registrationPage);
                        },
                        child: Text(
                          'Register Here!',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              BottomDesign(),
            ],
          ),
        ),
      ),
    );
  }
}
