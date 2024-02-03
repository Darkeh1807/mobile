import 'package:bus_booking/models/user_model.dart';
import 'package:bus_booking/utils/logger.dart';
import 'package:hive/hive.dart';

class UserHiveMethods {
  String userbox = 'user-box';

//Add user locally
  Future<void> addUser(User user) async {
    var box = await Hive.openBox(userbox);
    var userMap = userToJson(user);
    await box.put(user.id, userMap);
    logs.d(userMap);
    logs.d('User added locally');
  }

//Update local user
  Future<void> updateUser(User user) async {
    var box = await Hive.openBox(userbox);
    var userMap = userToJson(user);
    await box.put(user.id, userMap);
  }

  Future<void> deleteUser(User user) async {
    var box = await Hive.openBox(userbox);
    await box.delete(user.id);
    box.close();
    logs.d('User deleted succesffuly');
  }

  Future<User?> getHiveUser() async {
    try {
      var box = await Hive.openBox(userbox);
      if (box.isEmpty) {
        return null;
      }
      var userId = box.keys.first;
      dynamic userMap = box.get(userId);

      if (userMap != null && userMap.isNotEmpty) {
        User user = userFromJson(userMap);
        return user;
      } else {
        logs.d("No user found");
        return null;
      }
    } catch (e) {
      logs.d(e.toString());
      return null;
    }
  }
}
