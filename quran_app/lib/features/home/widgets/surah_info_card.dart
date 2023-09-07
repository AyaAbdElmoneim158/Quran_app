import 'package:quran_app/util/app_color.dart';

import '../../../common/widgets/general_card.dart';
import '../../../models/surah_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

BuildGeneralCard buildSurahInfoCard(SurahModel surah) {
  return BuildGeneralCard(
      height: 265,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(children: [
              Text(surah.nameTranslation,
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 26,
                          color: AppColors.kWitheColor))),
              const SizedBox(height: 4),
              Text(surah.nameEn,
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: AppColors.kWitheColor))),
              const SizedBox(height: 8),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 64),
                child: Divider(
                    height: 1, color: AppColors.kWitheColor, thickness: 1),
              ),
              const SizedBox(height: 8),
              Text("${surah.typeEn}  ${surah.array.length} verses ",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: AppColors.kWitheColor))),
            ]),
            Image.asset("assets/images/allahName.png")
          ],
        ),
      ));
}
