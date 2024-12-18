import 'package:flutter/material.dart';
import 'package:islami_pro/utilies/App%20colors.dart';
import 'package:islami_pro/quarn/sura%20model.dart';
import 'package:islami_pro/utilies/My%20App%20Styles.dart';

class SuraListWidget extends StatelessWidget {
  int index;


  SuraModel suraModel;
  SuraListWidget ({required this.suraModel,required this.index});
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Row(
          children: [
          Stack(alignment: Alignment.center,
            children: [
            Image.asset("assets/images/Vector.png",width: width*0.12,height: height*0.06,),
            Text("${index+1}",style:  MyAppStyle.white20Bold,),

          ],),
          SizedBox(width: 10,),
          Column( crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(suraModel.SuraEnName,style:  MyAppStyle.white20Bold,),
            Text ("${suraModel.AyaNumber}verses",style: MyAppStyle.white14Bold),


          ],),
          Spacer(),
          Text(suraModel.SuraArName,style:MyAppStyle.white20Bold,),

        ],),
        Divider(endIndent: 55,color: AppColors.white,indent: 50,),
      ],
    );

  }
}
