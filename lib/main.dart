import 'package:flutter/material.dart';
import 'package:islami_pro/hadith/hadith%20details.dart';
import 'package:islami_pro/home/Home_screen.dart';
import 'package:islami_pro/quarn/sura%20details.dart';
import 'package:islami_pro/sebha/sebha_tab.dart';
import 'package:islami_pro/utilies/theme%20data.dart';

void main() {
  runApp( MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {HomeScreen.routeName: (context)=>HomeScreen(),
      SuraDetails.routeName:(context)=>SuraDetails(),
        HadithDetails.routeName:(context)=>HadithDetails(),
        SebhaTab.routeName :(context)=>SebhaTab(),

      },
      initialRoute: HomeScreen.routeName,
      darkTheme: MyThemeData.darkTheme,
      themeMode: ThemeMode.dark,



    );
  }
}
