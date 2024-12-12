import 'package:flutter/material.dart';
import 'package:islami_pro/home/Home_screen.dart';
import 'package:islami_pro/quarn/sura%20details.dart';
import 'package:islami_pro/theme%20data.dart';

void main() {
  runApp( MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {HomeScreen.routeName: (context)=>HomeScreen(),
      SuraDetails.routeName:(context)=>SuraDetails()
      },
      initialRoute: HomeScreen.routeName,
      darkTheme: MyThemeData.darkTheme,
      themeMode: ThemeMode.dark,



    );
  }
}
