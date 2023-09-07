import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/util/app_color.dart';

Container quranCard() {
  return Container(
    margin: const EdgeInsets.only(top: 24),
    decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.kPurpleD0Color, AppColors.kPurpleD00Color])),
    height: 131,
    child: Stack(children: [
      Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Image.asset(
                  "assets/icons/book.png",
                  width: 20,
                  height: 20,
                ),
                const SizedBox(width: 8),
                Text("Last Read",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: AppColors.kWitheColor))),
              ]),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Al-Fatiah",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: AppColors.kWitheColor))),
                  Text("Ayah No: 1",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: AppColors.kWitheColor))),
                ],
              ),
            ]),
      ),
      Positioned(
          right: 0,
          bottom: 0,
          child: Image.asset(
            "assets/images/Quran.png",
          ))
    ]),
  );
}
