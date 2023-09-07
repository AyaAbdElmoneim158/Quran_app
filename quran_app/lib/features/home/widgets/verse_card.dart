// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/util/app_color.dart';
import '../../../models/quran_model.dart';
import '../../../models/surah_model.dart';
import '../../../util/audioplayers_helper.dart';
import '../services/home_services.dart';

class VerseCard extends StatelessWidget {
  final SurahModel surah;
  final int index;
  const VerseCard({
    Key? key,
    required this.surah,
    required this.index,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            decoration: BoxDecoration(
              color: AppColors.kbgDark2Color.withOpacity(0.05),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 13.5,
                  backgroundColor: AppColors.kPurpleD2Color,
                  child: Text("${index + 1}",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: AppColors.kWitheColor))),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Share.share(surah.array[index].ar);
                      },
                      child: Image.asset("assets/icons/share.png"),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () {
                        AudioplayersHelper.play(path: surah.array[index].path);
                      },
                      child: Image.asset("assets/icons/play.png"),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () {
                        QuranModel quranModel = QuranModel(
                            name: surah.array[index].ar,
                            nameTranslation: surah.array[index].en,
                            ayet: surah.name,
                            ayetAudio: surah.array[index].path);
                        HomeService.addFavorite(quranModel);
                        print("added");
                        var _bookmarks = HomeService.getFavorites();
                        print(_bookmarks.length);
                      },
                      child: false
                          //  HomeService.box.get(index)
                          ? const Icon(
                              Icons.play_arrow,
                              color: AppColors.kPurpleD2Color,
                            )
                          : Image.asset("assets/icons/bookmark.png"),
                    )
                  ],
                )
              ],
            )),
        const SizedBox(height: 24),
        Directionality(
          textDirection: TextDirection.rtl,
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(surah.array[index].ar,
                style: GoogleFonts.amiri(
                    textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ))),
          ),
        ),
        const SizedBox(height: 24),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(surah.array[index].en,
              style: GoogleFonts.poppins(
                  textStyle: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: AppColors.kTextDarkColor))),
        ),
        const SizedBox(height: 24),
        Divider(
            height: 1,
            color: AppColors.kTextLight2Color.withOpacity(0.35),
            thickness: 1),
      ],
    );
  }
}
