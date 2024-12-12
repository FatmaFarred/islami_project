import 'package:flutter/material.dart';
import 'package:islami_pro/App%20colors.dart';
import 'package:islami_pro/quarn/sura%20details.dart';
import 'package:islami_pro/quarn/sura%20list%20widget.dart';
import 'package:islami_pro/quarn/sura%20model.dart';

class QuranTab extends StatelessWidget {
  QuranTab({super.key});

  



  @override
  Widget build(BuildContext context) {
    return Container(margin: EdgeInsets.all(12),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset('assets/images/Islami.png'),
          TextField(
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.Gold ,width: 2),
                    borderRadius: BorderRadius.circular(15),

                ),
                focusedBorder:  OutlineInputBorder(borderSide: BorderSide(color: AppColors.Gold ,width: 2),
                  borderRadius: BorderRadius.circular(15),

                ),
                   prefixIcon: ImageIcon(AssetImage("assets/images/quran search.png",),color: AppColors.Gold,),
                    hintText: "sura name",
              hintStyle:  TextStyle(color: AppColors.white)
            ),
            cursorColor: AppColors.white,


          ),
          SizedBox(height: 20,),
          Text("Most recently",style: TextStyle(color: AppColors.white),),
          SizedBox(height: 10,),
          Container(
              decoration:BoxDecoration(borderRadius: BorderRadius.circular(20),
                 color: AppColors.Gold
          ),
          child: Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
            children: [Column(children: [
            Text("Sura en name"),
            Text("Sura Ar name"),
            Text ("Aya numbers")
            
          ],),
            Image.asset("assets/images/sura Image.png")
            
            
          ],),

          ),
          SizedBox(height: 10,),
          Text("Sura list",style: TextStyle( color: AppColors.white),),
          Expanded(child: ListView.builder(itemBuilder: (context,index){
            return InkWell(onTap:() {
                Navigator.of(context).pushNamed(SuraDetails.routeName , arguments: SuraModel.getSuraDetails(index) );
            },
              child: SuraListWidget(suraModel: SuraModel.getSuraDetails(index))
            );


          },
            itemCount:SuraModel.AyaNumberlist.length
          ))

        ],
      ),
    );
  }
}
