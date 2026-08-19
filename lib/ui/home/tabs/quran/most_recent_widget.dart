import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';

class MostRecentWidget extends StatelessWidget {
  const MostRecentWidget({super.key});
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Most Recently", style: AppStyles.bold16White),
        SizedBox(height: height * 0.01),
        SizedBox(
          height: height * 0.18,
          width: double.infinity,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColor.primColor,
                ),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Al-Anbiya", style: AppStyles.bold24Black),
                        Text("الأنبياء", style: AppStyles.bold24Black),
                        Text("112 Verses", style: AppStyles.bold14Black),
                      ],
                    ),
                    Image.asset(AppAssets.mostRecently),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: width * 0.02);
            },
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}
