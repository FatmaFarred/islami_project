

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_pro/utilies/App%20colors.dart';
import 'package:islami_pro/quarn/suara%20content%20widget.dart';
import 'package:islami_pro/quarn/sura%20model.dart';
import 'package:islami_pro/utilies/My%20App%20Styles.dart';

class SuraDetails extends StatefulWidget {
  static String routeName = "sura details";

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {

  List<String>Temporarylist=[];
  int selectedIndex=-1;
 //an empty list untill the file is being loaded so the ui won't be blocked
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var argus = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if(Temporarylist.isEmpty)
    {loadSuraFiles(argus.fileName);}

    return Scaffold(
      appBar: AppBar(
        title: Text(
          argus.SuraEnName,
          style: MyAppStyle.gold20Bold,
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
              SizedBox(height: height*0.07,),
            Text(argus.SuraArName,style: MyAppStyle.gold24Bold),
              SizedBox(height: 28,),
              Expanded(


                child:  Temporarylist.isEmpty?
                  Center(child: CircularProgressIndicator(color: AppColors.Gold,)):


                ListView.builder(itemBuilder: (context,index)
                {
                
                  return InkWell(
                      onTap: (){
                       setState(() {
                         selectedIndex=index;
                       });
                  },
                      splashColor: Colors.amber,
                      highlightColor: Colors.deepPurple.withOpacity(0.5),
                      child: SuraContentView(content: Temporarylist[index],index: index,selectedInedx: selectedIndex,));
                },
                  itemCount:Temporarylist.length ,
                ),
              )

          ],)
        ],
      ),
    );
  }

  void loadSuraFiles(String fileName)async{
    String suraContent= await rootBundle.loadString("assets/files/$fileName");
    List<String> SuraLines =suraContent.split('\n');// split the large string into lines to match the file
     Temporarylist=SuraLines;


     setState(() {

     });
    }
}
