import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/quran/details1/sura_details_screen1.dart';
import 'package:islami_app/ui/home/tabs/quran/details2/sura_details_screen2.dart';
import 'package:islami_app/ui/home/tabs/quran/quran_resources.dart';
import 'package:islami_app/ui/home/tabs/quran/most_recent_widget.dart';
import 'package:islami_app/ui/home/tabs/quran/sura_item.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:islami_app/utils/shared_prefs.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<int> filterList = List.generate(114, (index) => index);

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
          MostRecentWidget(),
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
<<<<<<< HEAD
                    Navigator.of(
                      context,
                    ).pushNamed(SuraDetailsScreen1.routeName, arguments: index);
=======
                    // todo: save last sura index in shared prefs
                    saveNewSuraList(filterList[index]);
                    // todo: navigate to sura details screen
                    Navigator.of(context).pushNamed(
                      SuraDetailsScreen1.routeName,
                      arguments: filterList[index],
                    );
>>>>>>> eddad09 (feat: save selected sura to recent list)
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
