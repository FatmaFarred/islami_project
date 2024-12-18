
import 'package:flutter/material.dart';




import 'package:islami_pro/radio/radiobottom.dart';
import 'package:islami_pro/radio/reciters%20tab.dart';
import 'package:islami_pro/utilies/App%20colors.dart';
import 'package:islami_pro/utilies/My%20App%20Styles.dart';

class RadioTab extends StatefulWidget {
  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  int selectedIndex = 0 ;

  int index=0;

  List<Widget> Bottomtaolist=[
    RadioBottom(),
    RecriterBottom()


  ];



 build(BuildContext context) {
    return  Scaffold(body:
    Column(crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(child: Image.asset("assets/images/Islami.png")),
        Row(
          children: [
            Expanded(child: ElevatedButton(style: ButtonStyle(backgroundColor:selectedIndex==0? WidgetStatePropertyAll(AppColors.Gold): WidgetStatePropertyAll(AppColors.Black)),
                onPressed: (){
              onpressed(0);



              }, child: ElevatedBottomIcon(0, "Radio", onpressed))),
            Expanded(child: ElevatedButton(style: ButtonStyle(backgroundColor:selectedIndex==1? WidgetStatePropertyAll(AppColors.Gold): WidgetStatePropertyAll(AppColors.Black)),
                onPressed: (){
              onpressed(1);

            },
                child: ElevatedBottomIcon(1, "Reciters", onpressed))),

          ],
        ),
    SizedBox(height: 10,),
    Column(children: [Bottomtaolist[selectedIndex]],)

      ],
    ),



    );
  }
  Widget ElevatedBottomIcon(int index , String text,Function onpressed){
    return selectedIndex ==index?
        Container(child: Text(text,style: MyAppStyle.Black16.copyWith(fontWeight: FontWeight.normal),),decoration: BoxDecoration(borderRadius: BorderRadius.circular(12))):
    Container(child: Text(text,style: MyAppStyle.GOLD16.copyWith(fontWeight: FontWeight.normal),),decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)));

  }

  void onpressed (int index){
    selectedIndex=index;
    setState(() {

    });

  }
}
