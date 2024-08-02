import 'package:flutter/material.dart';
import 'package:islami_app/Provider/settingsProvider.dart';
import 'package:islami_app/tabs/settings/languageButtomSheet.dart';
import 'package:islami_app/tabs/settings/themeButtomSheet.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
    return Scaffold(
      backgroundColor: AppColors.transparentColor,
      appBar: AppBar(
        backgroundColor: AppColors.transparentColor,
        title: Text(
          AppLocalizations.of(context)!.settings,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: AppColors.accentColor),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Language',
            textAlign: TextAlign.start,
          ),
          InkWell(
            onTap: (){
              onLanguageRowClick(context);
            },
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primaryColor)),
              child: Row(
                children: [
                  Text(provider.isEnglish?'English':'العربية'),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ),
          Text('Mode'),
          InkWell(
            onTap: (){
              onThemeRowClick(context);
            },
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primaryColor)),
              child: Row(
                children: [
                  Text('Light'),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  onLanguageRowClick(BuildContext context){
    showModalBottomSheet(context: context, builder: (context){
      return LanguageButtomSheet();
    });
  }

  onThemeRowClick(BuildContext context){
    showModalBottomSheet(context: context, builder: (context){
      return ThemeButtomSheet();
    });
  }
}
