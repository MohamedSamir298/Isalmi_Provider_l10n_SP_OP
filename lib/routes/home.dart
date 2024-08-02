import 'package:flutter/material.dart';
import 'package:islami_app/tabs/ahadeth/ahadeth_tab.dart';
import 'package:islami_app/tabs/quran/quran_tab.dart';
import 'package:islami_app/tabs/radio/radio_tab.dart';
import 'package:islami_app/tabs/sebha/sebha_tab.dart';
import 'package:islami_app/tabs/settings/settings_tab.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Home extends StatefulWidget {
  static String routeName = 'home';

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTab = 0;
  List<Widget>tabs = [
    QuranTab(),
    AhadethTab(),
    SebhaTab(),
    RadioTab(),
    SettingsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: AppColors.primaryColor),
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/quran_bg.png'),fit: BoxFit.fill)
        ),
        child: Scaffold(
          backgroundColor:AppColors.transparentColor,
          appBar: AppBar(
            backgroundColor: AppColors.transparentColor,
            elevation: 0,
            centerTitle: true,
            title: Text(
              AppLocalizations.of(context)!.islami,
              style: TextStyle(
                color: AppColors.accentColor,
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          body: tabs[currentTab],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentTab,
            onTap:(index){
              currentTab=index;
              setState(() {

              });
            } ,
            iconSize: 35,
            selectedFontSize: 12,
            selectedItemColor: AppColors.accentColor,
            items: [
              BottomNavigationBarItem(
                label: 'Quran',
                icon: ImageIcon(
                  AssetImage('assets/moshaf.png')
                ),
              ),
              BottomNavigationBarItem(
                label: 'Ahadeth',
                icon: ImageIcon(
                  AssetImage('assets/ahadeth.png')
                ),
              ),
              BottomNavigationBarItem(
                label: 'Sebha',
                icon: ImageIcon(
                  AssetImage('assets/sebha.png')
                ),
              ),
              BottomNavigationBarItem(
                label: 'Radio',
                icon: ImageIcon(
                  AssetImage('assets/radio.png')
                ),
              ),
              BottomNavigationBarItem(
                label: AppLocalizations.of(context)!.settings,
                icon: Icon(Icons.settings,size: 30,),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
