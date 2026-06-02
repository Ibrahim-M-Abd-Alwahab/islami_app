import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_styles.dart';

class SuraContentItem2 extends StatelessWidget {
  String suraContent;

  SuraContentItem2({super.key, required this.suraContent});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Text(
        suraContent,
        textDirection: TextDirection.rtl,
        style: AppStyles.bold20Primary,
        textAlign: TextAlign.center,
      ),
    );
  }
}
