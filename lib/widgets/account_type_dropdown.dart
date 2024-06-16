
import 'package:flutter/material.dart';
import '../models/account_type.dart';
import '../services/registration_api_service.dart';

class AccountTypeDropdown extends StatefulWidget {
  final String? initialValue;
  final ValueChanged<String?>? onChanged;
  final List<AccountType> accountTypes; 

  const AccountTypeDropdown({
    Key? key,
    required this.initialValue,
    required this.onChanged,
    required this.accountTypes, 
  }) : super(key: key);

  @override
  _AccountTypeDropdownState createState() => _AccountTypeDropdownState();
}

class _AccountTypeDropdownState extends State<AccountTypeDropdown> {
  List<AccountType> _accountTypes = [];
  bool _isLoading = true;

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
        _isLoading = false;
      });
    } catch (e) {
      print('Failed to fetch account types: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? CircularProgressIndicator()
        : DropdownButtonFormField<String>(
            value: widget.initialValue,
            onChanged: widget.onChanged,
            decoration: InputDecoration(
              labelText: 'Account Type:',
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.grey[200],
            ),
            items: _accountTypes.map((AccountType accountType) {
              return DropdownMenuItem<String>(
                value: accountType.name,
                child: Text(accountType.name),
              );
            }).toList(),
          );
  }
}
