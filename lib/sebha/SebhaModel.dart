class SebhaModel{

String zekr;
static List<String>zekrlist=["الحمد لله ", "الله اكبر ", "سبحان الله وبحمده سبحان الله العظيم ", "حسبي يا الله ونعم الوكيل "];

SebhaModel({required this.zekr});

static SebhaModel getSebhaModel (int index){
   return SebhaModel(zekr: zekrlist[index]);
}


}