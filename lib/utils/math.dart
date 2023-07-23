import 'dart:math';

class MathUtil {


  static int getRandomNumber(int min, int max) {
    return min + Random().nextInt(max - min);
  }
}