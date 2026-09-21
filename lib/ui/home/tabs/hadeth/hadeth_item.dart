import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/model/hadeth.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';

class HadethItem extends StatefulWidget {
  int index;

  HadethItem({super.key, required this.index});

  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
  Hadeth? hadeth;
  @override
  void initState() {

    super.initState();
    // TODO: implement initState
    loadHadethFile(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.01,
        vertical: height * 0.01,
      ),

      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(AppAssets.hadethDetailsBg)),
        borderRadius: BorderRadius.circular(20),
        color: AppColor.primColor,
      ),
      child:
          hadeth == null
              ? Center(
                child: CircularProgressIndicator(color: AppColor.blackColor),
              )
              : Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(AppAssets.hadethLeftCorner),
                      Expanded(
                        child: Text(
                          hadeth?.title ?? "",
                          textAlign: TextAlign.center,
                          style: AppStyles.bold24Black,
                        ),
                      ),
                      Image.asset(AppAssets.hadethRightCorner),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                      child: Text(
                        hadeth?.content ?? "",
                        textAlign: TextAlign.center,
                        style: AppStyles.bold16Black,
                      ),
                    ),
                  ),
                  Image.asset(AppAssets.hadethMosque),
                ],
              ),
    );
  }

  void loadHadethFile(int index) async {
    String fileContent = await rootBundle.loadString(
      'assets/files/hadeeth/h$index.txt',
    );
    int fileLinesIndex = fileContent.indexOf('\n');
    String title = fileContent.substring(0, fileLinesIndex);
    String content = fileContent.substring(fileLinesIndex + 1);
    hadeth = Hadeth(title: title, content: content);
    await Future.delayed(Duration(seconds: 1), () => setState(() {}));

    // List<String> hadethLines = fileContent.split('/n');
    // for (int i = 0; i < hadethLines.length; i++) {
    //   String title = hadethLines[0];
    //   hadethLines.removeAt(0); // content
    // }
  }
}
