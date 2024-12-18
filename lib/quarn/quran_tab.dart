import 'package:flutter/material.dart';
import 'package:islami_pro/utilies/App%20colors.dart';
import 'package:islami_pro/quarn/sura%20details.dart';
import 'package:islami_pro/quarn/sura%20list%20widget.dart';
import 'package:islami_pro/quarn/sura%20model.dart';
import 'package:islami_pro/utilies/My%20App%20Styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuranTab extends StatefulWidget {
  QuranTab({super.key});


  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  void addSuraDetailsList() {
    for (int i = 0; i < 114; i++) {
      SuraModel.suraDetailslist.add(SuraModel(
          SuraEnName: SuraModel.englishSuraList[i],
          SuraArName: SuraModel.arabicSuraList[i],
          AyaNumber: SuraModel.AyaNumberlist[i],
          fileName:'${i+1}.txt',
          index: i+1                     ),
                                      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addSuraDetailsList();

    loadLastSura();
   // removedata();

  }

  List<SuraModel> filterlist = SuraModel.suraDetailslist;
  String searchText='';
   Map<String,String> lastSuraMap ={};
  int index=0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(resizeToAvoidBottomInset: true,
        
        body: Container(
              margin:EdgeInsets.symmetric(horizontal:width*0.04 ),
              child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('assets/images/Islami.png'),
            TextField(style: MyAppStyle.white16Bold,
              onChanged:(text){
              searchText=text;
              filterlist=SuraModel.suraDetailslist.where((sura){
                return sura.SuraEnName.toLowerCase().contains(searchText.toLowerCase())||
                  sura.SuraArName.contains(searchText);




              }).toList();
              setState(() {

              });


              },
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.Gold, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.Gold, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: ImageIcon(
                    AssetImage(
                      "assets/images/quran search.png",
                    ),
                    color: AppColors.Gold,
                  ),
                  hintText: "sura name",
                  hintStyle: MyAppStyle.white16Bold),
              cursorColor: AppColors.white,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Most recently",
              style:MyAppStyle.white16Bold,
            ),
            SizedBox(
              height: 10,
            ),  lastSuraMap.isEmpty?Text("No item Saved",style:MyAppStyle.white16Bold,)
            :InkWell(onTap:() {
              Navigator.of(context).pushNamed(SuraDetails.routeName,arguments: filterlist[index]);
            },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: AppColors.Gold),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(lastSuraMap['suraEnName']??'',style: MyAppStyle.Black24Bold,),
                        Text(lastSuraMap['suraArName']??'',style: MyAppStyle.Black24Bold,),
                        Text("${lastSuraMap['Ayanumber']  ?? ''} verses",style:MyAppStyle.Black14Bold)
                      ],
                    ),
                    Image.asset("assets/images/sura Image.png")
                  ]
                )
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Sura list",
              style: MyAppStyle.white16Bold,
            ),
            Expanded(
              child: ListView.builder(
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          saveLatSura(suraEnName: filterlist[index].SuraEnName, suraArName: filterlist[index].SuraArName, Ayanumber: filterlist[index].AyaNumber);
                          Future.delayed(Duration(seconds: 2),loadLastSura);
                          Navigator.of(context).pushNamed(SuraDetails.routeName,
                              arguments: filterlist[index]);
              
                        },
                        child: SuraListWidget(
                          suraModel: filterlist[index],
                          index: index,
                        ));
                  },
                  itemCount: filterlist.length),
            )
          ],
        ),
              ),
            ));
  }
  ///write data make an object from Shared SharedPreferences bu calling the method get Intance
 Future<void> saveLatSura({required String suraEnName,required String suraArName , required String Ayanumber})async{
   final SharedPreferences prefs= await SharedPreferences.getInstance();
   await prefs.setString('suraEnName', suraEnName);
   await prefs.setString('suraArName', suraArName);
   await prefs.setString('Ayanumber', Ayanumber);
   //loadLastSura();
  }
  ///read data

  Future<Map<String,String>>getLastSura()async {
    final SharedPreferences prefs= await SharedPreferences.getInstance();
    return {
      'suraEnName': prefs.getString('suraEnName')??'',
      'suraArName': prefs.getString('suraArName')??'',
      'Ayanumber': prefs.getString('Ayanumber')??''
    };
  }

   loadLastSura()async{
    lastSuraMap=await getLastSura();
    setState(() {
      
    });


}
Future<void>removedata ()async{
    final SharedPreferences prefs =await SharedPreferences.getInstance();
    await prefs.remove('suraEnName');
    await prefs.remove('suraArName');
    await prefs.remove('Ayanumber');
   loadLastSura();

}
}
