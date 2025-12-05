// lib/services/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/activity_model.dart';

class ApiService {
  final String _base = 'https://jsonplaceholder.typicode.com';

  Future<List<ActivityModel>> fetchActivities({int start = 0, int limit = 10}) async {
    final uri = Uri.parse('$_base/posts?_start=$start&_limit=$limit');
    final res = await http.get(uri);
    if (res.statusCode == 200) {
      final List data = json.decode(res.body);
      return data.map((e) => ActivityModel.fromJson(e)).toList();
    } else {
      throw Exception('API Error: ${res.statusCode}');
    }
  }
}
