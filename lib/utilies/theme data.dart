import 'package:flutter/material.dart';
import 'package:islami_pro/utilies/App%20colors.dart';

class MyThemeData {
  static final ThemeData darkTheme=ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(selectedItemColor: AppColors.white,
      unselectedItemColor: AppColors.Black,),
    appBarTheme: AppBarTheme( backgroundColor:AppColors.Black,centerTitle: true,iconTheme: IconThemeData(color: AppColors.Gold ) ),

  );
}