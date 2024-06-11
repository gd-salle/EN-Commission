import 'package:flutter/material.dart';

class AccountTypeDropdown extends StatelessWidget {
  final String? initialValue;
  final ValueChanged<String?>? onChanged;

  const AccountTypeDropdown({Key? key, this.initialValue, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: initialValue,
      onChanged: onChanged,
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
    );
  }
}
