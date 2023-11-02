import 'dart:developer';
import 'package:http/http.dart' as http;

import '../const.dart';


class HttpGet {
  static Future<http.Response> get({
    String? url, required Map<String, String> body,
  }) async {
    final uri = Uri.parse('http://localhost:3000.$url');

    try {
      final response = await http
          .get(
            uri,
            headers: headers,
          )
          .timeout(const Duration(seconds: 20),
              onTimeout: () => http.Response("Timeout!", 408));
      return response;
    } catch (exception) {
      log(exception.toString());
      rethrow;
    }
  }
}