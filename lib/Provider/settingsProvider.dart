import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SettingsProvider extends ChangeNotifier {
  // String currentLocale = 'en';
  // bool isEnglish = true;

  String currentLocale;
  bool isEnglish;

  SettingsProvider(this.currentLocale,this.isEnglish){
    //sync method
    if(syncMethod() == false){
      currentLocale = 'en';
      isEnglish = true;
    }else {
      syncMethod();
      notifyListeners();
    }


  }

  Future syncMethod () async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    var result = pref.getString("lang");
    var rState = pref.getBool("isEnglish");
    if(pref.containsKey("lang")) {
      currentLocale = result!;
      isEnglish = rState!;
    }
    else {
      return false;
    }
  }
}