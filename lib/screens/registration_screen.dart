import 'package:flutter/material.dart';
import '../routes/app_routes.dart';
import '../widgets/account_type_dropdown.dart';
import '../widgets/text_field.dart';
import '../widgets/top_design.dart';
import '../widgets/bottom_design.dart';

class RegistrationScreen extends StatelessWidget {
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
                'REGISTER',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    AccountTypeDropdown(), // Account Type Dropdown
                    SizedBox(height: 10),
                    CustomTextField(label: 'Username:'),
                    SizedBox(height: 10),
                    CustomTextField(label: 'Email:'),
                    SizedBox(height: 10),
                    CustomTextField(label: 'Password:'),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red, // Button color
                        padding: EdgeInsets.symmetric(
                            horizontal: 100, vertical: 15),
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
              SizedBox(height: 20),
              BottomDesign(),
            ],
          ),
        ),
      ),
    );
  }
}
