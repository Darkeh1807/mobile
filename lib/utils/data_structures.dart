import 'dart:math';

class DataStructuresUtil {
  static T getRandomElement<T>(List<T> list) {
    final random = Random();
    var i = random.nextInt(list.length);
    return list[i];
  }
}