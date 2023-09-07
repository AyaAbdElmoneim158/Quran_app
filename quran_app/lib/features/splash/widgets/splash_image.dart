import 'package:flutter/material.dart';

class SplashImage extends StatelessWidget {
  const SplashImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image.asset("assets/images/quran_splash.png")),
        Positioned(
          bottom: -30,
          child: InkWell(
            onTap: () {
              Get.to(() => const BottomBar(), arguments: {
                'index': 0,
              });
            },
            child: Container(
              alignment: Alignment.center,
              width: 185,
              height: 60,
              padding: const EdgeInsets.all(17),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 4),
                        spreadRadius: 0,
                        blurRadius: 4,
                        color: Colors.black.withOpacity(0.25))
                  ],
                  color: AppColors.kColor,
                  borderRadius: const BorderRadius.all(Radius.circular(30))),
              child: const Text(
                "Get Started",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.kWitheColor),
              ),
            ),
          ),
        )
      ],
    );
  }
}
