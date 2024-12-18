import 'package:flutter/material.dart';
import 'package:islami_pro/utilies/App%20colors.dart';

class WidgetView extends StatelessWidget {
String Name;

WidgetView ({required this.Name});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  Container(height: height*0.14,width: width*0.90,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
            color: AppColors.Gold,image: DecorationImage(image: AssetImage("assets/images/radio wi bg.png",),fit: BoxFit.fill )),
      child: Column(children: [Text(Name),
        Expanded(
          child: Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,
            //mainAxisSize: MainAxisSize.min,
            children: [Image.asset("assets/images/heart.png"),
              Image.asset("assets/images/play.png"),
              Image.asset("assets/images/Sound.png"),
          
            ],),
        )

      ],

      ),
    );
  }
}
