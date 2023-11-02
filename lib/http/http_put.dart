import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import '../const.dart';

class HttpPut {
  static Future<http.Response> put({
    String? url,
    Map<String, Object>? body,
  }) async {
    try {
      var requisicao = (body == null) ? "" : body;
      final uri = Uri.parse('http://localhost:3000$url');

      final response = await http
          .put(uri, headers: headers, body: jsonEncode(requisicao))
          .timeout(const Duration(seconds: 20),
              onTimeout: () => http.Response("Timeout!", 408));

      return response;
    } catch (exception) {
      log(exception.toString());
      rethrow;
    }
  }
}