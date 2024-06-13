// lib/screens/login_screen.dart
import 'package:flutter/material.dart';
import '../widgets/account_type_dropdown.dart';
import '../widgets/top_design.dart';
import '../widgets/bottom_design.dart';
import '../routes/app_routes.dart';
import '../models/account_type.dart';
import '../services/registration_api_service.dart';
import '../services/login_api_service.dart'; // Import the LoginApiService

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>(); // Key for the form
  String? _username;
  String? _password;
  String? _selectedAccountType;
  List<AccountType> _accountTypes = [];
  
  @override
  void initState() {
    super.initState();
    _fetchAccountTypes();
  }

  Future<void> _fetchAccountTypes() async {
    try {
      List<AccountType> accountTypes = await RegistrationApiService.fetchAccountTypes();
      setState(() {
        _accountTypes = accountTypes;
      });
    } catch (e) {
      print('Failed to fetch account types: $e');
    }
  }

  // lib/screens/login_screen.dart

void _loginUser() async {
  if (_formKey.currentState!.validate()) {
    _formKey.currentState!.save();
    try {
      int accountTypeId = _accountTypes.firstWhere((type) => type.name == _selectedAccountType).id;
      bool success = await LoginApiService.loginUser(
        _username!, 
        _password!, 
        accountTypeId
      );
      if (success) {
        Navigator.pushNamed(context, AppRoutes.landingPage);
      } else {
        _showErrorDialog('Invalid username, password, or account type');
      }
    } catch (e) {
      _showErrorDialog('Failed to login. Please try again.');
    }
  }
}


  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

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
                        accountTypes: _accountTypes, // Pass accountTypes here
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
                        onPressed: _loginUser, // Call _loginUser on press
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
