import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/routes/ahadeth_details.dart';
import '../../model/ahadeth_data.dart';
import '../../utils/app_colors.dart';

class AhadethTab extends StatelessWidget {
  List<Hadeth> ahadethList = [];

  @override
  Widget build(BuildContext context) {
    if (ahadethList.isEmpty) {
      readAhadethFile();
    }

    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(flex: 35, child: Image.asset('assets/ahadeth_img.png')),
          Divider(
            color: AppColors.primaryColor,
            thickness: 3,
          ),
          Text(
            'Ahadeth',
            style: TextStyle(
                color: AppColors.accentColor,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
          Divider(
            color: AppColors.primaryColor,
            thickness: 3,
          ),
          Expanded(
            flex: 65,
            child: ListView.separated(
                itemBuilder: (context, index) =>
                    buildHadethNameItem(index, context),
                separatorBuilder: (context, index) => Divider(
                      color: AppColors.primaryColor,
                      thickness: 1,
                    ),
                itemCount: ahadethList.length),
          ),
        ],
      ),
    );
  }

  readAhadethFile() async {
    String hadethFile =
        await rootBundle.loadString('assets/ahadeth_files/ahadeth.txt');
    List<String> ahadeth = hadethFile.split('#');
    for (int i = 0; i < ahadeth.length; i++) {
      List<String> singleHadethLines = ahadeth[i].trim().split('\n');
      String title = singleHadethLines.removeAt(0);
      String content = singleHadethLines.join('\n');
      ahadethList.add(Hadeth(title, content));
    }
  }

  Widget buildHadethNameItem(index, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, HadethScreen.routeName,arguments: ahadethList[index]);
      },
      child: Text(
        '${ahadethList[index].title}',
        style: TextStyle(color: AppColors.accentColor, fontSize: 25),
        textAlign: TextAlign.center,
      ),
    );
  }
}
