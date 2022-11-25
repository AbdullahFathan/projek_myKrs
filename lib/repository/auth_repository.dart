import 'dart:convert';

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
          "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VyIjp7IklEIjoxLCJDcmVhdGVkQXQiOiIyMDIyLTExLTI1VDA4OjExOjE4LjIxMiswNzowMCIsIlVwZGF0ZWRBdCI6IjIwMjItMTEtMjVUMDg6MTE6MTguMjEyKzA3OjAwIiwiRGVsZXRlZEF0IjpudWxsLCJOSU0iOiIyMTUxNTA3MDAxMTEwMzUiLCJOYW1hIjoiREFGRkEgTkFCSUwgSEFLSU0iLCJKZW5qYW5nIjoiUzEiLCJGYWt1bHRhcyI6IklsbXUgS29tcHV0ZXIiLCJKdXJ1c2FuIjoiVGVrbm9sb2dpIEluZm9ybWFzaSIsIlByb2dyYW1TdHVkaSI6IlRla25vbG9naSBJbmZvcm1hc2kiLCJTZWxla3NpIjoiU2VsZWtzaSBCZXJzYW1hIE1hc3VrIFBlcmd1cnVhbiBUaW5nZ2kgTmVnZXJpIEJyYXdpamF5YSAtIE1hbGFuZyIsIk5vbW9yVWppYW4iOiIxMjEzNzIwMjA2MjIiLCJKYWR3YWxEYXJpVXNlciI6bnVsbCwiS3JzSmR1IjpudWxsLCJLcnNKZHMiOm51bGx9LCJleHAiOjE2Njk1MTE0Nzh9.P80IcoH45RrCyWQv-qdz6Nxpsh4XWQXkjJweQU5QjUs",
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
