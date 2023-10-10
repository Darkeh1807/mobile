import 'package:bus_booking/models/user_model.dart';
import 'package:bus_booking/utils/logger.dart';
import 'package:hive/hive.dart';

class UserHiveMethods {
  String hivebox = 'user-box';


//Add user locally
  addUser(User user) async {
    var box = await Hive.openBox(hivebox);
    var userMap = user.toJson();
    await box.put(user.id, userMap);
    logs.d(userMap);
    logs.d('User added locally');
  }

//Update local user
  updateUser(User user) async {
    var box = await Hive.openBox(hivebox);
    var userMap = user.toJson();
    await box.put(user.id, userMap);
  }

  deleteUser(User user) async {
    var box = await Hive.openBox(hivebox);
    await box.delete(user.id);
  }

  Future<User?> getHiveUser(User user) async {
    try {
      if (user.id != null && user.id!.isNotEmpty) {
        var box = await Hive.openBox(hivebox);
        var userMap = box.get(user.id);
        if (userMap != null) {
          return User.fromJson(userMap);
        }
      }
    } catch (e) {
      logs.d(e.toString());
    }
    return null;
  }
}
