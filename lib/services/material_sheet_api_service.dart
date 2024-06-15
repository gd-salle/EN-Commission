import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/material_sheet.dart';

class MaterialSheetApiService {
  static const String apiUrl = 'http://10.0.2.2/property_REST_API/material_sheet.php';

  // Add a new material sheet
  static Future<bool> addMaterialSheet(MaterialSheet materialSheet) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(materialSheet.toJson()),
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      return responseBody['success'];
    } else {
      throw Exception('Failed to add material sheet');
    }
  }

  // Fetch all material sheets
  static Future<List<MaterialSheet>> fetchMaterialSheets() async {
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> responseBody = json.decode(response.body);
      return responseBody.map((data) => MaterialSheet.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load material sheets');
    }
  }

  // Update an existing material sheet
  static Future<bool> updateMaterialSheet(MaterialSheet materialSheet) async {
    final response = await http.put(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(materialSheet.toJson()),
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      return responseBody['success'];
    } else {
      throw Exception('Failed to update material sheet');
    }
  }
}
