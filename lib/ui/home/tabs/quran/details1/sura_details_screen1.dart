import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/ui/home/tabs/quran/details1/sura_content_item1.dart';
import 'package:islami_app/ui/home/tabs/quran/details2/sura_content_item2.dart';
import 'package:islami_app/ui/home/tabs/quran/quran_resources.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';

class SuraDetailsScreen1 extends StatefulWidget {
  static const String routeName = 'sura-details1';

  const SuraDetailsScreen1({super.key});

  @override
  State<SuraDetailsScreen1> createState() => _SuraDetailsScreen1State();
}

class _SuraDetailsScreen1State extends State<SuraDetailsScreen1> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery
        .of(context)
        .size
        .height;
    int index = ModalRoute
        .of(context)
        ?.settings
        .arguments as int;
    if (verses.isEmpty) {
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
              verses.isEmpty
                  ? CircularProgressIndicator(color: AppColor.primColor)
                  : Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(height: height * 0.02);
                  },
                  shrinkWrap: true,
                  itemCount: verses.length,
                  itemBuilder: (context, index) {
                    return SuraContentItem1(
                      suraContent: verses[index],
                      index: index,
                    );
                  },
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
    // for (int i = 0; i < lines.length; i++) {
    //   print(lines[i]);
    // }
    verses = lines;
    Future.delayed(Duration(seconds: 1), () {
      setState(() {});
    });
  }
}
