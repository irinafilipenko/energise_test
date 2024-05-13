import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static getRequest() async {
    const baseUrl = "http://ip-api.com/json/";
    try {
      var url = Uri.parse(baseUrl);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Error();
      }
    } catch (e) {
      throw Error();
    }
  }
}
