import 'dart:async';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../const.dart';

class HttpPost {
  static Future<http.Response> post(
      {String? url, Map<String, Object>? body}) async {
    var requisicao = (body == null) ? "" : body;
    final uri = Uri.parse('http://localhost:3000$url');

    try {
      final response = await http
          .post(uri, headers: headers, body: json.encode(requisicao))
          .timeout(const Duration(seconds: 20));
      return response;
    } catch (exception) {
      log(exception.toString());
      rethrow;
    }
  }
}