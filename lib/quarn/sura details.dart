import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_pro/App%20colors.dart';
import 'package:islami_pro/quarn/suara%20content%20widget.dart';
import 'package:islami_pro/quarn/sura%20model.dart';

class SuraDetails extends StatefulWidget {
  static String routeName = "sura details";

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {

  List<String>Temporarylist=[];
  int selectedIndex=0;
 //an empty list untill the file is being loaded so the ui won't be blocked
  @override
  Widget build(BuildContext context) {
    var argus = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if(Temporarylist.isEmpty)
    {loadSuraFiles(argus.index);}

    return Scaffold(
      appBar: AppBar(
        title: Text(
          argus.SuraEnName,
          style: TextStyle(color: AppColors.Gold),
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
              SizedBox(height: 36,),
            Text(argus.SuraArName,style: TextStyle( color: AppColors.Gold,fontSize: 24)),
              SizedBox(height: 28,),
              Expanded(


                child:  Temporarylist.isEmpty?
                  Center(child: CircularProgressIndicator(color: AppColors.Gold,)):


                InkWell(onTap: (){

                },
                  child: ListView.builder(itemBuilder: (context,index)
                  {

                    return SuraContentView(content: Temporarylist[index],index: index,);
                  },
                    itemCount:Temporarylist.length ,
                  ),
                ),
              )

          ],)
        ],
      ),
    );
  }

  void loadSuraFiles(int index)async{
    String suraContent= await rootBundle.loadString("assets/files/${index+1}.txt");
    List<String> SuraLines =suraContent.split('\n');// split the large string into lines to match the file
     Temporarylist=SuraLines;

     setState(() {

     });
    }
}
