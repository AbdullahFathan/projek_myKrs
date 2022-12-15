import 'package:get_storage/get_storage.dart';

class Cache {
  static final box = GetStorage();

  static Future<void> writeData({
    required String key,
    required dynamic value,
  }) async {
    await box.write(key, value);
    print("has write [cahce_repository.dart]");
  }

  static Future<String> getData(String key) async {
    String result = await box.read(key);
    return result;
  }

  static Future<void> deleteData(String key) async {
    await box.remove(key);
  }
}