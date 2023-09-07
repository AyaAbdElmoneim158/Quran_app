import 'dart:async';

import 'package:quran_app/features/splash/widgets/splash_image.dart';
import 'package:quran_app/features/splash/widgets/splash_intro_text.dart';

import '../../../constants/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants/app_color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Get.to(() => const BottomBar(), arguments: {
        'index': 0,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [SplashIntroText(), SizedBox(height: 49), SplashImage()],
        ),
      ),
    );
  }
}
