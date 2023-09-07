import 'package:flutter/material.dart';
import 'package:quran_app/util/app_color.dart';

class BuildGeneralCard extends StatelessWidget {
  const BuildGeneralCard(
      {super.key, required this.height, required this.child});
  final double height;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Stack(
        // alignment: Alignment.center,
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            // margin: const EdgeInsets.only(top: 24),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.kPurpleD0Color,
                      AppColors.kPurpleD00Color
                    ])),
          ),
          Positioned(
              right: 0,
              bottom: 0,
              child: Image.asset(
                "assets/images/Quran_light.png",
                // fit: BoxFit.cover,
                height: 100,
              )),
          child
        ],
      ),
    );
  }
}
