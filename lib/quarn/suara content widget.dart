import 'package:flutter/material.dart';
import 'package:islami_pro/utilies/App%20colors.dart';
import 'package:islami_pro/utilies/My%20App%20Styles.dart';

class SuraContentView extends StatelessWidget {
  String content;
  int index;
  int selectedInedx;

  SuraContentView({required this.content , required this.index, required this.selectedInedx});

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(

      margin: EdgeInsets.symmetric(horizontal: width*0.04),
      padding: EdgeInsets.symmetric(vertical:10),
      decoration: BoxDecoration( color: selectedInedx==index?AppColors.Gold:Colors.transparent,

          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.Gold, width: 2)),
      child: Text("$content {${index + 1}}" , style:selectedInedx==index? MyAppStyle.black20Bold:MyAppStyle.gold20Bold,textAlign: TextAlign.center,textDirection: TextDirection.rtl,),
    );
  }
}
