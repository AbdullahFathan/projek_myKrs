import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http_parser/http_parser.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mykrs_projek/models/matkul_model.dart';

import 'package:mykrs_projek/repository/cache_repository.dart';

var baseUrl = dotenv.get('BASE_URL');
var tokenUser = dotenv.get('TOKEN_KEY');

Future<String> getToken() async {
  var token = await Cache.getData("token");
  return token;
}

class JDU {
  //var token = getToken();

  final _dio = Dio();

  Future postJDU(PlatformFile exel) async {
    print("masuk ke fungsi postjdu pada jdu_repository");
    try {
      final fileByte = exel.bytes;
      print("file byte berhasil didapatkan");

      var mfile = MultipartFile.fromBytes(
        fileByte as List<int>,
        filename: exel.name,
        contentType: MediaType("input", "file"),
      );
      print("mfile berhasil didapatkan");
      var formData = FormData.fromMap({
        'file': mfile,
      });
      print("form data berhasil didapatkan");

      //_dio.options.headers["Authorization"] = "Bearer $token";

      var response = await _dio.post(
        "$baseUrl/api/upload-jdu",
        data: formData,
        options: Options(headers: {
          "Authorization": tokenUser,
          "ngrok-skip-browser-warning": true,
        }),
      );
      print("response berhasil ke send");

      if (response.statusCode == 204) {
        print("Upload JDu has success [jdu_repository]");
        return true;
      } else {
        print(
            "Upload JDu has failed and status code ${response.statusCode} [jdu_repository]");
      }
    } catch (eror) {
      print("eror at postJDU [jdu_repository] ${eror.toString()}");
    }
    return false;
  }

  Future getJDU() async {
    try {
      var response = await _dio.get("$baseUrl/api/get-jdu",
          options: Options(headers: {
            "Authorization": tokenUser,
            "ngrok-skip-browser-warning": true,
          }));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = response.data as Map<String, dynamic>;
      
        List<Map<String, dynamic>> result = data['data']  ;

        List<Matkul> dataMatkul = result
            .map((e) => Matkul.fromJson(e)).toList();
        return dataMatkul;
      } else {
        print(
            "failed getJDU [jdu_repository] and status code ${response.statusCode}");
      }
    } catch (e) {
      print("eror getJDU [jdu_repository.dart] = ${e.toString()}");
    }
    return null;
  }
}

List<WaktuJadwalUser> getWaktuJadwalUser(List<Map<String, dynamic>> data) {
  List<WaktuJadwalUser> result = data
      .map((item) => WaktuJadwalUser(
            id: item['ID'],
            jadwalDariUserId: item["JadwalDariUserID"],
            hari: item["Hari"],
            jamAkhir: item["JamAkhir"],
            jamMulai: item["JamMulai"],
          ))
      .toList();

  return result;
}
