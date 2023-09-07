import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashIntroText extends StatelessWidget {
  const SplashIntroText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text("Quran App",
          style: GoogleFonts.poppins(
              textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 28,
                  ))),
      const SizedBox(height: 16),
      Text("Learn Quran and\nRecite once everyday",
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
              textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ))),
    ]);
  }
}
