import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/account_type.dart';
import '../models/user_account.dart';

class RegistrationApiService {
  static const String apiUrl = 'http://10.0.2.2/property_REST_API';

  static Future<List<AccountType>> fetchAccountTypes() async {
    final response = await http.get(Uri.parse('$apiUrl/account_type.php'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((accountType) => AccountType.fromJson(accountType)).toList();
    } else {
      throw Exception('Failed to load account types');
    }
  }

  static Future<String> registerUser(UserAccount userAccount) async {
    final response = await http.post(
      Uri.parse('$apiUrl/user_account.php'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(userAccount.toJson()),
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      if (responseBody['success']) {
        return 'success';
      } else {
        return responseBody['message'];
      }
    } else {
      throw Exception('Failed to register user');
    }
  }
}
