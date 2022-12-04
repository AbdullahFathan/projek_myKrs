

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mykrs_projek/repository/cache_repository.dart';

var baseUrl = dotenv.get('BASE_URL');

class AuthRepository {
  final _dio = Dio();

  Future loginRepository(String nim, String password) async {
    try {
      var response = await _dio.post("$baseUrl/api/login",
          options: Options(
            headers: {
              "Content-Type": "application/json; charset=utf-8",
            },
          ),
          data: {
            "nim": nim,
            "password": password,
          });

      if (response.statusCode == 200) {
        var data = response.data;
        await Cache.writeData(
            key: "token", value: data["data"]["Authorization"]);
        print("=============DATA==============");
        print(data);
        return true;
      } else{
        print( "Login Invalid  and status code = ${response.statusCode} [auth_repository.dart]");
      }
    } catch (e) {
      print("Eror at LoginServices [auth_repository.dart]: ${e.toString()}");
    }
    return false;
  }
  /*
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
        await Cache.writeData(key: "token", value: data["data"]["Authorization"]);
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
  */
}
