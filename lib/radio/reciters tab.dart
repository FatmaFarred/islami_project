import 'package:flutter/material.dart';
import 'package:islami_pro/radio/buttom%20widget.dart';

class RecriterBottom extends StatefulWidget {

  @override
  State<RecriterBottom> createState() => _RadioBottomState();
}


class _RadioBottomState extends State<RecriterBottom> {
  List<Widget>Reciterlist=[];
  void addList(){
    for (int i =1; i < 4 ; i++){
      Reciterlist.add(WidgetView(Name: "Reciter $i"));
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
    return  Column(children: Reciterlist,);
  }
}
