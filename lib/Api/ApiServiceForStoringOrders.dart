import 'dart:convert';
import '../const.dart';
import 'package:http/http.dart' as http;

class ApiServiceForStoringOrder {
  static Future<bool> storeorder(Map<String, dynamic> body) async {
    const String URL = baseUrl + "orders";
    final response = await http.post(
        Uri.parse(URL), headers: {"Content-Type": "application/json"},
        body: json.encode(body));
    final String res = response.body;
    // print(res);
    if (res != 'null') {
      print(res);
      try {
        final jsonData = json.decode(res) as Map<String, dynamic>;
        return true;
      } catch (e) {}
    }
    return false;
  }
}