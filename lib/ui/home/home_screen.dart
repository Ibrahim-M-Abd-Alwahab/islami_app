import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/hadeth/hadeth.dart';
import 'package:islami_app/ui/home/tabs/quran/quran_tab.dart';
import 'package:islami_app/ui/home/tabs/radio/radio.dart';
import 'package:islami_app/ui/home/tabs/sebha/sebha.dart';
import 'package:islami_app/ui/home/tabs/time/time.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home_screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<String> backgroundImages = [
    AppAssets.quranBg,
    AppAssets.hadethBg,
    AppAssets.sebhaBg,
    AppAssets.radioBg,
    AppAssets.timeBg,
  ];
  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          // getBackgroundImage(),
          backgroundImages[selectedIndex],
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AppAssets.logo),
              Expanded(child: tabs[selectedIndex]),
            ],
          ),

          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(canvasColor: AppColor.primColor),
            child: BottomNavigationBar(
              // backgroundColor: AppColor.primColor,
              // type: BottomNavigationBarType.fixed,
              currentIndex: selectedIndex,
              // showUnselectedLabels: true,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              items: [
                builtBottomNavigationBarItem(
                  index: 0,
                  imageName: AppAssets.iconQuran,
                  label: "Quran",
                ),
                builtBottomNavigationBarItem(
                  index: 1,
                  imageName: AppAssets.iconHadeth,
                  label: "Hadeth",
                ),
                builtBottomNavigationBarItem(
                  index: 2,
                  imageName: AppAssets.iconSebha,
                  label: "Sebha",
                ),
                builtBottomNavigationBarItem(
                  index: 3,
                  imageName: AppAssets.iconRadio,
                  label: "Radio",
                ),
                builtBottomNavigationBarItem(
                  index: 4,
                  imageName: AppAssets.iconTime,
                  label: "Time",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  builtBottomNavigationBarItem({
    required int index,
    required String imageName,
    required String label,
  }) {
    return BottomNavigationBarItem(
      label: label,
      icon:
          selectedIndex == index
              ? Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(66),
                  color: AppColor.blackBgColor,
                ),
                child: ImageIcon(AssetImage(imageName)),
              )
              : ImageIcon(AssetImage(imageName)),
    );
  }

  String getBackgroundImage() {
    switch (selectedIndex) {
      case 0:
        return AppAssets.quranBg;
      case 1:
        return AppAssets.hadethBg;
      case 2:
        return AppAssets.sebhaBg;
      case 3:
        return AppAssets.radioBg;
      case 4:
        return AppAssets.timeBg;
      default:
        return AppAssets.quranBg;
    }
  }
}
