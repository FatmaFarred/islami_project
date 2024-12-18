import 'package:flutter/material.dart';
import 'package:islami_pro/utilies/App%20colors.dart';
import 'package:islami_pro/hadith/hadith_tab.dart';

import 'package:islami_pro/quarn/quran_tab.dart';
import 'package:islami_pro/radio/radio_tab.dart';
import 'package:islami_pro/sebha/sebha_tab.dart';
import 'package:islami_pro/time/time_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home screen";


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0 ;
  List<String>backgroundlist=[
    "assets/images/background image.png",
    "assets/images/hadith bg.png",
    "assets/images/sebha bg.png",
    "assets/images/radio bg.png",
    "assets/images/time bg.png",
  ];
  List<Widget>tabslist=[
    QuranTab(),
    HadithTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),



  ];


  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        backgroundlist[selectedIndex],
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.fill,
      ),
      Scaffold(
        bottomNavigationBar:
        Theme(data: Theme.of(context).copyWith(canvasColor:AppColors.Gold),
              child: BottomNavigationBar(iconSize: 30,
                  currentIndex: selectedIndex,
                  onTap: (index) {
                selectedIndex=index;

                    setState(() {

                    });
                  },
                  items:
              [BottomNavigationBarItem
                (
                 icon: buildItemBottomNavigationBar(index: 0, ImageName: "quran icon"),
                  label: "Quran"
                                    ),
                BottomNavigationBarItem
                  (icon: buildItemBottomNavigationBar(index: 1, ImageName: "hadith"),

                  label: "Hadeth"),
                BottomNavigationBarItem
                  (icon: buildItemBottomNavigationBar(index: 2, ImageName: "sebha"),
                    label: "Sebha"),
                BottomNavigationBarItem
                  (icon: buildItemBottomNavigationBar(index: 3, ImageName: "radio"),
                    label: "Radio"),
                BottomNavigationBarItem
                  (icon: buildItemBottomNavigationBar(index: 4, ImageName: "timer"),
                    label: "Timer")






              ]

              ),

            ),
        body: tabslist[selectedIndex],

      ),
    ]);
  }
  Widget buildItemBottomNavigationBar({required int index , required String ImageName}){
    return selectedIndex ==index?
      Container(padding: EdgeInsets.symmetric(vertical: 6,horizontal: 20),decoration: BoxDecoration(
     borderRadius: BorderRadius.circular(66) ,color: AppColors.LightBlack,
    ),
     child:ImageIcon(AssetImage("assets/images/$ImageName.png"))
    ):

    ImageIcon(AssetImage("assets/images/$ImageName.png"))
    ;
  }
}
