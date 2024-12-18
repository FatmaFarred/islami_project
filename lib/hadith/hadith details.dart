import 'package:flutter/material.dart';
import 'package:islami_pro/utilies/App%20colors.dart';
import 'package:islami_pro/hadith/hadithmodel.dart';
import 'package:islami_pro/utilies/My%20App%20Styles.dart';

class HadithDetails extends StatelessWidget {
  static String routeName = "Hadith Details";

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    var args = ModalRoute.of(context)?.settings.arguments as hadithModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          args.Title,
          style: MyAppStyle.Gold20
        ),
      ),
      body: Stack(alignment: Alignment.center,
        children: [
          Container(
            color: AppColors.Black,
            child: Image.asset(
              "assets/images/Group suradetails.png",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Column(
            children: [
              SizedBox(height: height * 0.06,),
              Text(args.Title,style: MyAppStyle.Gold20),
             SizedBox( height: 15),
              Expanded(


                child:
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: width*0.06 ),
                    child: Text(args.content.join(''),style:MyAppStyle.GOLD16,textAlign: TextAlign.center,textDirection: TextDirection.rtl,),
                  )
                ),


            ],)
        ],
      ),
    );

  }
}