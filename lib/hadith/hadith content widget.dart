import 'package:flutter/material.dart';
import 'package:islami_pro/utilies/App%20colors.dart';
import 'package:islami_pro/utilies/My%20App%20Styles.dart';


class HadithContentView extends StatelessWidget {
  String Title;
  String content;
  HadithContentView({required this.Title , required this.content});
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(padding: EdgeInsets.symmetric(horizontal: width *0.04),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
            color: AppColors.Gold, image: DecorationImage(image: AssetImage("assets/images/hadith gr.png",),fit: BoxFit.fill  ),
        ),
          child:Column(
            children: [
              SizedBox(height: height * 0.06),
            Text(Title ,style: MyAppStyle.Black24,),
              SizedBox(height:height * 0.05,),
            Expanded(child: SingleChildScrollView(child: Text(content,style: MyAppStyle.Black16,textDirection:TextDirection.rtl ,textAlign: TextAlign.center,))),
            

          ],)

    );
  }
}
