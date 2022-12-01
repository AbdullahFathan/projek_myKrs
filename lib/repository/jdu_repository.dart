import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http_parser/http_parser.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:mykrs_projek/models/matkul_model.dart';
import 'package:mykrs_projek/repository/cache_repository.dart';

var baseUrl = dotenv.get('BASE_URL');

class JDU {
  var client = http.Client();

  Future getToken() async {
    var token = await Cache.getData('user_token');
    return token;
  }

  var token = JDU().getToken();

  Future postJDU(PlatformFile exel, String name, String email) async {
    var _dio = Dio();

    try {
      var mfile = MultipartFile.fromBytes(exel.bytes!,
          filename: exel.name, contentType: MediaType("file", "xlxs"));
      var formData = FormData();
      formData.files.add(MapEntry("file", mfile));
      //_dio.options.headers["Authorization"] = "Bearer $token";

      var response = await _dio.post("$baseUrl/api/upload-jdu",
          options: Options(headers: {"Authorization": "Bearer $token"}));

      if(response.statusCode == 201){
        print("Upload JDu has success [jdu_repository]");
        return true;
      } else{
        print("Upload JDu has failed and status code ${response.statusCode} [jdu_repository]");

      }
    } catch (eror) {
      print("eror at postJDU [jdu_repository] ${eror.toString()}");
    }
    return false;
  }
}
