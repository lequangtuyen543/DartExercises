import 'dart:convert';
import 'package:http/http.dart' as http;
import 'user_model.dart';

class AuthService {
  static const String baseUrl = 'https://dummyjson.com';

  /// Đăng nhập
  static Future<User?> login(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        return User.fromJson(jsonDecode(response.body));
      }
    } catch (_) {}
    return null;
  }

  /// Lấy lại thông tin user
  static Future<User?> getProfile(String token) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/auth/me'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return User.fromJson({...data, 'accessToken': token});
      }
    } catch (_) {}
    return null;
  }
}