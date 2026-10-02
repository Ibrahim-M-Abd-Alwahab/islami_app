import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'dart:math';

class SebhaTab extends StatefulWidget {
  SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  int zekrIndex = 0;
  double rotation = 0;
  final List<String> zekraIndex = ["سبحان الله", "الحمد لله", "الله أكبر"];

  void increaseCounter() {
    setState(() {
      counter++;
      rotation += 1 / 33;

      if (counter == 33) {
        counter = 0;

        zekrIndex++;

        if (zekrIndex == zekraIndex.length) {
          zekrIndex = 0;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Text("سَبِّحِ اسْمَ رَبِّكَ الأعلى", style: AppStyles.bold36White),
        Expanded(
          child: InkWell(
            onTap: increaseCounter,
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Transform.rotate(
                    angle: rotation * 2 * pi,
                    origin: const Offset(0, 40),
                    child: Image.asset(
                      'assets/images/sebhaImage.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(0, 45),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          zekraIndex[zekrIndex],
                          style: AppStyles.bold36White,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '$counter',
                          style: AppStyles.bold36White,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
