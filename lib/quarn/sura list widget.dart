import 'package:flutter/material.dart';
import 'package:islami_pro/App%20colors.dart';
import 'package:islami_pro/quarn/sura%20model.dart';

class SuraListWidget extends StatelessWidget {


  SuraModel suraModel;
  SuraListWidget ({required this.suraModel});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          Stack(alignment: Alignment.center,
            children: [
            Image.asset("assets/images/Vector.png"),
            Text("${suraModel.index+1}",style: TextStyle(color: AppColors.white,fontWeight: FontWeight.bold),),

          ],),
          SizedBox(width: 10,),
          Column( crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(suraModel.SuraEnName,style: TextStyle(color: Colors.white),),
            Text ("${suraModel.AyaNumber}verses",style: TextStyle(color: Colors.white)),


          ],),
          Spacer(),
          Text(suraModel.SuraArName,style: TextStyle(color: Colors.white)),

        ],),
        Divider(endIndent: 55,color: AppColors.white,indent: 50,),
      ],
    );

  }
}
