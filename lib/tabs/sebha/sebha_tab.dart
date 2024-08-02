import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_colors.dart';

class SebhaTab extends StatefulWidget {

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double angle = 0;
  int tasbehCount = 0;
  int index = 0;
  List <String> zekr = ['سبحان الله','الحمد لله','لا إله إلا الله','لا حول ولا قوة إلا بالله','الله أكبر'];

  @override
  Widget build(BuildContext context) {

    return Container(
      color: AppColors.transparentColor,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            splashColor: Colors.transparent ,
            onTap: (){
              onZekrTap();
            },
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.1),
                  child: Image.asset('assets/head of seb7a.png' ),
                ),
                Padding(
                  padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.1),
                  child: Transform.rotate(angle: angle,
                  child: Image.asset('assets/body of seb7a.png')),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.05),
            child: Text('tasbeh count',style: TextStyle(color: AppColors.accentColor,fontSize: 25),),
          ),
          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*.01),

            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              '$tasbehCount',
              style: TextStyle(color: AppColors.accentColor,fontSize: 25),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*.03),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              zekr[index],
              style: TextStyle(color: Colors.white,fontSize: 25),
            ),
          ),
        ],
      ),
    );
  }

  onZekrTap(){
    tasbehCount++;
    angle+=0.12;
    if(tasbehCount%33==0){
      index++;
    }
    if(index==5){
      index=0;
    }
    setState(() {

    });
  }
}
