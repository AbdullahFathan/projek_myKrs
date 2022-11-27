import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

var baseUrl = dotenv.get('BASE_URL');

class AuthRepository {
  var client = http.Client();
  Future loginRepository(String nim, String password) async {
    var uri = Uri.parse("$baseUrl/api/login");
    try {
      var response = await client.post(uri,
          headers: {
            "Content-Type": "application/json; charset=utf-8",
          },
          body: json.encode({
            "nim": nim,
            "password": password,
          }));

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        print("=============DATA==============");
        print(data);
        return true;
      } else {
        var data = jsonDecode(response.body);

        print(
            "Login Invalid  and status code = ${response.statusCode} [auth_repository.dart]");
        print(" form server =  ${data['error']}  ##[auth_repository.dart]");
      }
    } catch (eror) {
      print("Eror at LoginServices [auth_repository.dart]: ${eror.toString()}");
    }
    return false;
  }
}
