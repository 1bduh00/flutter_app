import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthApi {
  static const String baseUrl = 'http://192.168.11.104:8083/auth';

  static Future<bool> login(String email, String password) async {
    Map<String, dynamic> requestBody = {
      'c_email': email,
      'c_password': password,
    };
    final url = Uri.parse('$baseUrl/signin');
    try {
      http.Response response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json', // Set the correct Content-Type
        },
        body: jsonEncode(requestBody), // Encode the request body as JSON
      );

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        // Request successful, handle the respons
        return true;
      }
      // Request failed, handle the error
      return false;
    } catch (e) {
      // An error occurred while making the request
      print('Error: $e');
      return false;
    }
  }
}
