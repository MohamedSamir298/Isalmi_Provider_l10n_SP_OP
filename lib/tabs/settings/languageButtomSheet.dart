import 'package:flutter/material.dart';
import 'package:islami_app/Provider/settingsProvider.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageButtomSheet extends StatefulWidget {
  @override
  State<LanguageButtomSheet> createState() => _LanguageButtomSheetState();
}

class _LanguageButtomSheetState extends State<LanguageButtomSheet> {

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Text('Language'),
          InkWell(onTap: () async {
            provider.isEnglish=true;
            provider.currentLocale="en";
            SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
            sharedPreferences.setString("lang", "en");
            sharedPreferences.setBool("isEnglish", true);
            provider.notifyListeners();
            setState(() {

            });
          }, child: Text('English',
            style: TextStyle(
              color: provider.isEnglish
                  ? AppColors.primaryColor
                  : AppColors.accentColor,
            ),)),
          InkWell(
            onTap: () async {
              provider.isEnglish=false;
              provider.currentLocale="ar";
              SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
              sharedPreferences.setString("lang", "ar");
              sharedPreferences.setBool("isEnglish", false);
              provider.notifyListeners();
              setState(() {

              });
            },
            child: Text(
              'العربية',
              style: TextStyle(
                color: provider.isEnglish
                    ? AppColors.accentColor
                    : AppColors.primaryColor
              ),
            ),
          ),

        ],
      ),
    );
  }
}
