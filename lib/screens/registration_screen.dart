
import 'package:flutter/material.dart';
import '../routes/app_routes.dart';
import '../widgets/account_type_dropdown.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/top_design.dart';
import '../widgets/bottom_design.dart';
import '../services/registration_api_service.dart';
import '../models/user_account.dart';
import '../models/account_type.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>(); 
  String? _username;
  String? _email;
  String? _password;
  String? _selectedAccountType;
  bool _isPasswordValid = false;
  List<AccountType> _accountTypes = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchAccountTypes();
  }

  Future<void> _fetchAccountTypes() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final accountTypes = await RegistrationApiService.fetchAccountTypes();
      setState(() {
        _accountTypes = accountTypes;
      });
    } catch (e) {
      
      _showErrorDialog(context, 'Failed to load account types. Please try again.');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
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
                      'REGISTER',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Form(
                        key: _formKey, 
                        child: Column(
                          children: [
                            AccountTypeDropdown(
                              initialValue: _selectedAccountType,
                              onChanged: (value) {
                                setState(() {
                                  _selectedAccountType = value;
                                });
                              },
                              accountTypes: _accountTypes, 
                            ),
                            SizedBox(height: 10),
                            CustomTextField(
                              label: 'Username:',
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
                            CustomTextField(
                              label: 'Email:',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                if (!value.contains('@unc.edu.ph')) {
                                  return 'Please enter a valid UNC email address';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _email = value;
                              },
                            ),
                            SizedBox(height: 10),
                            CustomTextField(
                              label: 'Password:',
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                if (value.length < 8) {
                                  return 'Password must be at least 8 characters long';
                                }
                                if (!value.contains(RegExp(r'[A-Z]'))) {
                                  return 'Password must contain at least one capital letter';
                                }
                                if (!value.contains(RegExp(r'[0-9]'))) {
                                  return 'Password must contain at least one number';
                                }
                                if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                                  return 'Password must contain at least one special character';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  _isPasswordValid = _validatePassword(value);
                                });
                              },
                              onSaved: (value) {
                                _password = value;
                              },
                            ),
                            SizedBox(height: 5),
                            if (!_isPasswordValid)
                              Text(
                                'Password Requirements: At least 8 characters, 1 Capital, 1 Special Character, 1 Number',
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  print('Form is valid, proceeding to register');  
                                  _registerUser();
                                } else {
                                  print('Form is invalid');  
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                              ),
                              child: Text(
                                'Register',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              "Already have an account?",
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 5),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, AppRoutes.loginPage);
                              },
                              child: Text(
                                'Login Here!',
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

  bool _validatePassword(String value) {
    return value.length >= 8 &&
        value.contains(RegExp(r'[A-Z]')) &&
        value.contains(RegExp(r'[0-9]')) &&
        value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  }

  void _registerUser() async {
    if (_accountTypes.isEmpty) {
      _showErrorDialog(context, 'Account types are not loaded. Please try again.');
      return;
    }

    try {
      final selectedAccountType = _accountTypes.firstWhere((type) => type.name == _selectedAccountType);
      final userAccount = UserAccount(
        id: 0, 
        accountTypeId: selectedAccountType.id,
        username: _username!,
        email: _email!,
        password: _password!,
      );

      bool success = await RegistrationApiService.registerUser(userAccount);
      if (success) {
        _showSuccessDialog(context);
      } else {
        _showErrorDialog(context, 'Registration failed. Please try again.');
      }
    } catch (e) {
      _showErrorDialog(context, 'Registration failed. Please try again.');
    }
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Registration Successful'),
          content: Text('You have been successfully registered. Redirecting to login page...'),
        );
      },
    );

    Future.delayed(Duration(seconds: 2), () {
      Navigator.pop(context); 
      Navigator.pushNamed(context, AppRoutes.loginPage); 
    });
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
        );
      },
    );
  }
}
