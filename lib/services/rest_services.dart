import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class RestService {
  static get(String url) async {
    Response data = await http.get(Uri.parse(url));
    var decodedData = json.decode(data.body);
    if (data.statusCode == 200) {
      return decodedData;
    } else {
      return decodedData['message'];
    }
  }
}
