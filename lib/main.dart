import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami_app/Provider/settingsProvider.dart';
import 'package:islami_app/routes/ahadeth_details.dart';
import 'package:islami_app/routes/home.dart';
import 'package:islami_app/routes/sura_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/utils/http_override_request.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  HttpOverrides.global = MyHttpOverrides();


  runApp(ChangeNotifierProvider(
      create: (_) => SettingsProvider('en',true), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: false
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('ar'), // Arabic
      ],
      locale: Locale(provider.currentLocale),
      debugShowCheckedModeBanner: false,
      routes: {
        Home.routeName: (_) => const Home(),
        QuranSura.routeName: (_) =>  QuranSura(),
        HadethScreen.routeName: (_) => HadethScreen(),
      },
      initialRoute: Home.routeName,
    );
  }
}
