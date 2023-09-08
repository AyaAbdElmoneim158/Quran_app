import 'package:quran_app/util/app_color.dart';

import '../../../common/widgets/custom_app_bar.dart';
import '../../../common/widgets/general_card.dart';
import '../../../models/hadith_model.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HadithDetailsScreen extends StatelessWidget {
  const HadithDetailsScreen({super.key, required this.hadith});
  final Hadith hadith;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        searchedList: [],
        title: hadith.category,
        iconPath: "assets/icons/backArrow.png",
        onPressedLeading: () => Get.back(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemCount: hadith.array.length,
            itemBuilder: (context, index) => index % 2 == 0
                ? FadeInLeftBig(
                    duration: const Duration(milliseconds: 1200),
                    child: _buildHadithCard(index),
                  )
                : FadeInRightBig(
                    duration: const Duration(milliseconds: 1200),
                    child: _buildHadithCard(index),
                  ),
          ),
        ),
      ),
    );
  }

  BuildGeneralCard _buildHadithCard(int index) {
    return BuildGeneralCard(
        height: 250,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 16,
          ),
          child: Center(
            child: Text(hadith.array[index].hadith,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.amiri(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: AppColors.kWitheColor))),
          ),
        ));
  }
}
