  import 'dart:math';
  import 'dart:convert';

  import 'package:flutter/material.dart';
  import 'package:flutter/services.dart';
  import 'package:islami_pro/sebha/SebhaModel.dart';
  import 'package:islami_pro/sebha/sebha%20view.dart';


  class SebhaTab extends StatefulWidget {
    static String routeName="sebha tab";

    @override
    State<SebhaTab> createState() => _SebhaTabState();
  }

  class _SebhaTabState extends State<SebhaTab> {
  int counter =0;
  int index =0;
  bool isrotated=false;

  void incrementCounter() {
    setState(() {
      counter++;
      isrotated = !isrotated;
      if (index < 4 && counter % 10 == 0) {
        index++;
      }
      if (index >= 4) {
        index = 0;
      }
    });
  }

    @override
    Widget build(BuildContext context) {


      return Column(
        children: [
          Container(
            child:SebhaView(sebhaModel: SebhaModel.getSebhaModel(index),ontap:incrementCounter ,counter: counter,isrotated: isrotated,),
          ),
          /*InkWell(onTap:incrementCounter ,

              child: AnimatedRotation(
                   duration: Duration(milliseconds: 300) ,
                     turns: isrotated ? -1 / 24 : 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Image.asset("assets/images/SebhaBody.png",width: double.infinity,),
                    Column(children: [Text("$counter"),],)

                  ],
                ),
              ),

              )
          )*/


        ],
      );
    }
  }






































