import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

const baseUrl = "https://d60d-2a09-bac0-412-00-81d-6928.ap.ngrok.io";

class AuthRepository {
  var client = http.Client();
  Future loginRepository(String nim, String password) async {
    var uri = Uri.parse("$baseUrl/api/debug");
    try {
      var response = await client.get(
        uri,
        headers: {
          "Authorization": dotenv.get('TOKEN_KEY'),
        },
      );

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
