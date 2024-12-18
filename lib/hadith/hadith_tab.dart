import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_pro/hadith/hadith%20content%20widget.dart';
import 'package:islami_pro/hadith/hadith%20details.dart';
import 'package:islami_pro/hadith/hadithmodel.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HadithTab extends StatefulWidget {
  @override
  State<HadithTab> createState() => _HadithTabState();
}

class _HadithTabState extends State<HadithTab> {
  List<hadithModel> hadithlist = [];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    if (hadithlist.isEmpty) {
      loadhadithfiles();
    }
    return Column(
      children: [
        Image.asset('assets/images/Islami.png'),
        Container(
            child: hadithlist.isEmpty
                ? Center(child: CircularProgressIndicator())
                : CarouselSlider.builder(
                    itemCount: hadithlist.length,
                    options: CarouselOptions(
                      enableInfiniteScroll: true,
                      height: height*0.66,
                      viewportFraction: 0.75,
                      enlargeCenterPage: true,
                    ),
                    itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) =>
                        InkWell(
                            onTap: () {Navigator.of(context).pushNamed(HadithDetails.routeName,
                                arguments:hadithlist[itemIndex] );},
                            child: HadithContentView(
                              Title: hadithlist[itemIndex].Title,
                              content: hadithlist[itemIndex].content.join(''),
                            ))))
      ],
    );
  }

  void loadhadithfiles() async {
    for (int i = 1; i <= 50; i++) {
      String hadithContent = await rootBundle.loadString("assets/files/h$i.txt");
      List<String> hadithLines = hadithContent.split('\n');
      for (int i = 0; i < hadithLines.length; i++) {
        print(hadithLines[i]);
      }
      String title = hadithLines[0];
      hadithLines.removeAt(0);
      hadithModel hadithmo = hadithModel(Title: title, content: hadithLines);
      hadithlist.add(hadithmo);
      setState(() {});
    }
  }
}
