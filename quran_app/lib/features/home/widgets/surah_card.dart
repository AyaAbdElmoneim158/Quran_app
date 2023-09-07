import '../screen/surah_details_screen.dart';
import '../../../models/surah_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildSurahCard extends StatelessWidget {
  const BuildSurahCard({super.key, required this.surah, required this.index});

  final SurahModel surah;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(SurahDetailsScreen(surah: surah), transition: Transition.zoom);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset("assets/Icons/star.png"),
                Text(
                  '${index + 1}',
                  style: GoogleFonts.poppins(
                      textStyle: Theme.of(context).textTheme.bodySmall),
                )
              ],
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  surah.nameTranslation,
                  style: GoogleFonts.poppins(
                      textStyle: Theme.of(context).textTheme.bodyLarge),
                ),
                const SizedBox(height: 4),
                Text(
                  "${surah.typeEn}  ${surah.array.length} verses ",
                  style: GoogleFonts.poppins(
                      textStyle: Theme.of(context).textTheme.bodyMedium),
                ),
              ],
            )
          ]),
          Text(surah.name,
              style: GoogleFonts.amiri(
                  textStyle: Theme.of(context).textTheme.labelLarge)),
        ],
      ),
    );
  }
}
