import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/quran/details1/sura_details_screen1.dart';
import 'package:islami_app/ui/home/tabs/quran/sura_item.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            cursorColor: AppColor.primColor,
            decoration: InputDecoration(
              prefixIcon: Image.asset(AppAssets.iconSearch),
              hintText: "Sura Name",
              hintStyle: Theme.of(context).textTheme.headlineLarge,
              // hintStyle: AppStyles.bold16White,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: AppColor.primColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: AppColor.primColor),
              ),
            ),
          ),
          SizedBox(height: height * 0.02),
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
          SizedBox(height: height * 0.01),
          Text("Sura's List", style: AppStyles.bold16White),
          SizedBox(height: height * 0.01),
          Expanded(
            child: ListView.separated(
              itemCount: 114,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(
                      context,
                    ).pushNamed(SuraDetailsScreen1.routeName, arguments: index);
                  },
                  child: SuraItem(index: index),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  indent: width * 0.1,
                  endIndent: width * 0.05,
                  thickness: 2,
                  color: AppColor.whiteColor,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
