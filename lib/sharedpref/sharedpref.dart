import 'package:shared_preferences/shared_preferences.dart';

class sharedpref {
  saveuid(String uid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('uid', uid);
  }

  getuid() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return await prefs.getString('uid');
    } catch (e) {
      return null;
    }
  }
}
