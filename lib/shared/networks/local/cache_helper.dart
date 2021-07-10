import 'package:shared_preferences/shared_preferences.dart';


class CacheHelper {
  static late SharedPreferences sharedPreferences ;

  static  init () async {
    sharedPreferences = await SharedPreferences.getInstance();
    print('the Instance of SharedPreferences is created Successfully');
  }

  static  setBoolean ({
    required String key ,
    required bool value ,
})  {
   sharedPreferences.setBool(key, value);
  }
  static bool? getBoolean ({required String key}) {
    return sharedPreferences.getBool(key);
  }

}