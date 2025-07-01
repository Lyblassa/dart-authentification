import 'package:http/http.dart' as http;

class AuthService {
  static const String backendUrl = 'http://10.0.2.2:32769';

  static Future<bool> verifyWithBackend(String idToken) async {
    final url = Uri.parse('$backendUrl/api/auth/verify');
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $idToken'},
    );
    return response.statusCode == 200;
  }

  static Future<bool> sendRegistrationToBackend(String idToken) async {
    final url = Uri.parse('$backendUrl/api/auth/register');
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $idToken',
      },
    );
    return response.statusCode == 200;
  }
}
