// lib/services/login_api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginApiService {
  static const String apiUrl = 'http://10.0.2.2/property_REST_API'; // Replace with your API URL

  // Login a user
  static Future<bool> loginUser(String username, String password, int accountTypeId) async {
    final response = await http.post(
      Uri.parse('$apiUrl/user_account.php'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'username': username,
        'password': password,
        'account_type_id': accountTypeId,
      }),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body)['success'];
    } else {
      throw Exception('Failed to login user');
    }
  }
}
