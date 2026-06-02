import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/ui/home/tabs/quran/details2/sura_content_item2.dart';
import 'package:islami_app/ui/home/tabs/quran/quran_resources.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';

class SuraDetailsScreen2 extends StatefulWidget {
  static const String routeName = 'sura-details2';

  const SuraDetailsScreen2({super.key});

  @override
  State<SuraDetailsScreen2> createState() => _SuraDetailsScreen2State();
}

class _SuraDetailsScreen2State extends State<SuraDetailsScreen2> {
  String suraContent = '';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    int index = ModalRoute.of(context)?.settings.arguments as int;
    if (suraContent.isEmpty) {
      loadSuraFile(index);
    }
    return Scaffold(
      backgroundColor: AppColor.blackBgColor,
      appBar: AppBar(
        title: Text(
          QuranResources.englishQuranList[index],
          style: AppStyles.bold20Primary,
        ),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            color: AppColor.blackBgColor,
            child: Image.asset(
              AppAssets.detailsBg,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Column(
            children: [
              Text(
                QuranResources.arabicQuranList[index],
                style: AppStyles.bold24Primary,
              ),
              SizedBox(height: height * 0.09),
              Container(
                // padding: EdgeInsets.symmetric(horizontal: 20),
                child:
                    suraContent.isEmpty
                        ? CircularProgressIndicator(color: AppColor.primColor)
                        : Expanded(
                          child: SingleChildScrollView(
                            child: SuraContentItem2(suraContent: suraContent),
                          ),
                        ),
              ),
              SizedBox(height: height * 0.2),
            ],
          ),
        ],
      ),
    );
  }

  void loadSuraFile(int index) async {
    String fileContent = await rootBundle.loadString(
      "assets/files/${index + 1}.txt",
    );
    List<String> lines = fileContent.split('\n');
    for (int i = 0; i < lines.length; i++) {
      lines[i] += '[${i + 1}] ';
    }
    suraContent = lines.join();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {});
    });
  }
}
