import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
    Login({
        required this.nim,
        required this.password,
    });

     String nim;
    String password;

    factory Login.fromJson(Map<String, dynamic> json) => Login(
        nim: json["nim"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "nim": nim,
        "password": password,
    };
}