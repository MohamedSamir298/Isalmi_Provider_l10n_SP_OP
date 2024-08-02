import 'package:flutter/material.dart';
import 'package:islami_app/model/ahadeth_data.dart';

import '../utils/app_colors.dart';

class HadethScreen extends StatelessWidget {
static String routeName = 'HadethScreen';
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Hadeth ;
    return Container(
      decoration: BoxDecoration(
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
          title: Text(
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                '${args.title}',
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.accentColor, fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  args.content,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.accentColor, fontSize: 20,)
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
