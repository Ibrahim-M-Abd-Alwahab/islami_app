import 'package:flutter/material.dart';
import 'package:islami_app/providers/most_recent_provider.dart';
import 'package:islami_app/ui/home/tabs/quran/details1/sura_details_screen1.dart';
import 'package:islami_app/ui/home/tabs/quran/quran_resources.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:provider/provider.dart';

class MostRecentWidget extends StatefulWidget {
  const MostRecentWidget({super.key});

  @override
  State<MostRecentWidget> createState() => _MostRecentWidgetState();
}

class _MostRecentWidgetState extends State<MostRecentWidget> {
  late MostRecentProvider mostRecentProvider;
  @override
  void initState() {
    // TODO: implement initState
    // todo: this bloc of code can be execute before build
    super.initState();
    // todo: this bloc of code can be execute after build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      mostRecentProvider.getSuraMostRecentSuraList();
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    mostRecentProvider = Provider.of<MostRecentProvider>(context);
    return Visibility(
      visible: mostRecentProvider.mostRecentList.isNotEmpty,
      child: Column(
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
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        SuraDetailsScreen1.routeName,
                        arguments: mostRecentProvider.mostRecentList[index],
                      );
                    },
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              QuranResources.englishQuranList[mostRecentProvider
                                  .mostRecentList[index]],
                              style: AppStyles.bold24Black,
                            ),
                            Text(
                              QuranResources.arabicQuranList[mostRecentProvider
                                  .mostRecentList[index]],
                              style: AppStyles.bold24Black,
                            ),
                            Text(
                              QuranResources.versesNumberList[mostRecentProvider
                                  .mostRecentList[index]],
                              style: AppStyles.bold14Black,
                            ),
                          ],
                        ),
                        Image.asset(AppAssets.mostRecently),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: width * 0.02);
              },
              itemCount: mostRecentProvider.mostRecentList.length,
            ),
          ),
        ],
      ),
    );
  }
}
