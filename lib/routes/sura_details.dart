import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/model/sura_details_data.dart';

import '../utils/app_colors.dart';

class QuranSura extends StatefulWidget {
  static String routeName = 'QuranSura';

  const QuranSura({super.key});

  @override
  State<QuranSura> createState() => _QuranSuraState();
}

class _QuranSuraState extends State<QuranSura> {
  String suraContent = '';
  List<String> suraLines = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as SuraDetailsArgs;
    if (suraContent.isEmpty) {
      readSuraContent(args.fileName);
    }
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/quran_bg.png'), fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: AppColors.transparentColor,
        appBar: AppBar(
          backgroundColor: AppColors.transparentColor,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
            color: AppColors.accentColor,
          ),
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'Islami',
            style: TextStyle(
              color: AppColors.accentColor,
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '${args.suraName}',
              textAlign: TextAlign.center,
              style: const TextStyle(color: AppColors.accentColor, fontSize: 25,
              fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => suraLinesBuilder(index),
                  itemCount: suraLines.length,
                separatorBuilder: (context,index)=>suraLinesDivider(),
              ),
            )
          ],
        ),
      ),
    );
  }

  readSuraContent(String fileName) async {
    suraContent = await rootBundle.loadString('assets/quran_files/$fileName');
    suraLines = suraContent.trim().split('\n');
    setState(() {});
  }

  Widget suraLinesBuilder(int index) {
    return Text(
      textAlign: TextAlign.end,
      '(${index+1}) ${suraLines[index]}',
      style: const TextStyle(
        color: AppColors.accentColor,
        fontSize: 25,
      ),
    );
  }

  Widget suraLinesDivider() {
    print('devid');
    return const Divider(
      color: AppColors.primaryColor,
      thickness: 1,
    );
  }
}
