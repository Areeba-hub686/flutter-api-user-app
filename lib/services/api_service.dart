import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

class ApiService {

  static const String _baseUrl =
      'https://jsonplaceholder.typicode.com/users';

  Future<List<User>> fetchUsers() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);

        return jsonData
            .map((user) => User.fromJson(user))
            .toList();
      } else {
        throw Exception(
          'Failed to load users. Status Code: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Something went wrong: $e');
    }
  }
}