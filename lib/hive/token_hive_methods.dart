import 'package:bus_booking/utils/logger.dart';
import 'package:hive/hive.dart';

class TokenHiveMethods {
  final tokenbox = 'token-box';

  Future<void> addToken(String token) async {
    final box = await Hive.openBox(tokenbox);
    box.put('token', token);
    logs.d(token);
  }

  Future<String?> getToken() async {
    final box = await Hive.openBox(tokenbox);
    if (box.isEmpty) {
      return null;
    }

    var tokenKey = box.keys.first;
    final token = box.get(tokenKey);
    return token;
  }

  Future<void> deleteToken() async {
    final box = await Hive.openBox(tokenbox);
    await box.delete("token");
    box.close();
    logs.d("Token deleted succesfully");
  }
}
