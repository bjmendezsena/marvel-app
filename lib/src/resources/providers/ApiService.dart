import 'package:http/http.dart' as http;

class ApiService {
  static _getHeaders() {
    return {'Content-type': 'application/json'};
  }

  static Future<http.Response> invokeGet(url) async {
    final resp = await http.get(url, headers: _getHeaders());

    return resp;
  }
}
