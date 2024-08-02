import 'package:flutter/material.dart';
import 'package:islami_app/model/sura_details_data.dart';
import 'package:islami_app/routes/sura_details.dart';
import 'package:islami_app/utils/app_colors.dart';

class QuranTab extends StatelessWidget {
  List<String> suraNames = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(flex: 35, child: Image.asset('assets/quran_tab_image.png')),
          Divider(
            color: AppColors.primaryColor,
            thickness: 3,
          ),
          Text(
            'Sura name',
            style: TextStyle(color: AppColors.accentColor, fontSize: 25),
          ),
          Divider(
            color: AppColors.primaryColor,
            thickness: 3,
          ),
          Expanded(
            flex: 65,
            child: ListView.separated(
              itemBuilder: (context, index) {
                return buildSuraNameItem(index,context);
              },
              itemCount: suraNames.length,
              separatorBuilder: (context,index) {
                return Divider(
                  color: AppColors.primaryColor,
                  thickness: 1,
                );
              },
            ),
          )
        ],
      ),
    );
  }
  Widget buildSuraNameItem(index,BuildContext context){
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context,QuranSura.routeName,
            arguments: SuraDetailsArgs(fileName: '${index+1}.txt', suraName: suraNames[index]) );
      },
      child: Text(
        '${suraNames[index]}',
        style: TextStyle(color: AppColors.accentColor, fontSize: 25),
        textAlign:TextAlign.center,
      ),
    );

  }
}
