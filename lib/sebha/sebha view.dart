import 'package:flutter/material.dart';
import 'package:islami_pro/utilies/App%20colors.dart';
import 'package:islami_pro/sebha/SebhaModel.dart';
import 'package:islami_pro/utilies/My%20App%20Styles.dart';

class SebhaView extends StatelessWidget {
  int counter ;

  bool isrotated;

  
 SebhaModel sebhaModel;
  GestureTapCallback ontap;

  SebhaView({required this.sebhaModel, required this.ontap,required this.counter , required this.isrotated});
  @override
  Widget build(BuildContext context) {
    return Column(

       children: [
        Image.asset("assets/images/Islami.png"),

        Image.asset("assets/images/sebha head.png"),

         Stack(alignment: Alignment.center,
             children: [
           InkWell(onTap:ontap ,

               child: AnimatedRotation(
                 duration: Duration(milliseconds: 300) ,
                 turns: isrotated ? -1 / 24 : 0,
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Image.asset("assets/images/SebhaBody.png",width: double.infinity,),),


                   ),
                 ),
           Column(children: [Text(sebhaModel.zekr,style:MyAppStyle.white36Bold,),Text("$counter",style: MyAppStyle.white36Bold)],)



         ]
                     )



       ],);
  }
}
