import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';

class SuraContentItem1 extends StatelessWidget {
  String suraContent;
  int index;

  SuraContentItem1({super.key, required this.suraContent, required this.index});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.04),
      padding: EdgeInsets.symmetric(vertical: height * 0.02),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColor.primColor, width: 2),
      ),
      child: Text(
        "$suraContent[${index + 1}]",
        textDirection: TextDirection.rtl,
        style: AppStyles.bold20Primary,
        textAlign: TextAlign.center,
      ),
    );
  }
}
