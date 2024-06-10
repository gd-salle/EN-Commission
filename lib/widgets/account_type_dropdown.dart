import 'package:flutter/material.dart';

class AccountTypeDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'Account Type:',
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Colors.grey[200],
      ),
      items: <String>['Student', 'Teacher', 'Admin'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        // Process
      },
    );
  }
}
