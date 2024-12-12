import 'package:flutter/material.dart';
import 'package:islami_pro/App%20colors.dart';

class SuraContentView extends StatelessWidget {
  String content;
  int index;

  SuraContentView({required this.content , required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.Gold, width: 2)),
      child: Text("$content {${index + 1}}" , style: TextStyle(color: AppColors.Gold , fontSize:18),textAlign: TextAlign.center,textDirection: TextDirection.rtl,),
    );
  }
}
