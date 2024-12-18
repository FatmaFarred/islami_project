import 'package:flutter/material.dart';
import 'package:islami_pro/radio/buttom%20widget.dart';

class RadioBottom extends StatefulWidget {

  @override
  State<RadioBottom> createState() => _RadioBottomState();
}


class _RadioBottomState extends State<RadioBottom> {
  List<Widget>radiolist=[];
  void addList(){
    for (int i =1; i < 4 ; i++){
      radiolist.add(WidgetView(Name: "Name $i"));
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addList();
  }



  @override
  Widget build(BuildContext context) {
    return  Column(children: radiolist,);
  }
}
