import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/model/hadeth.dart';
import 'package:islami_app/utils/app_colors.dart';

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
    // TODO: implement initState
    loadHadethFile(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColor.primColor,
      ),
      child:
          hadeth == Null
              ? Center(
                child: CircularProgressIndicator(color: AppColor.blackColor),
              )
              : Column(
                children: [
                  Text(hadeth?.title ?? ""),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(hadeth?.content ?? ""),
                    ),
                  ),
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
