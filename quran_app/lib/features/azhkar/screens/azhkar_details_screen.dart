import 'package:quran_app/util/app_color.dart';

import '../../../common/widgets/custom_app_bar.dart';
import '../../../common/widgets/general_card.dart';
import '../../../models/adhkar_model.dart';
import '../../../util/audioplayers_helper.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class AzhkarDetailsScreen extends StatelessWidget {
  const AzhkarDetailsScreen({super.key, required this.azhkar});
  final Adhkar azhkar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        searchedList: [],
        title: azhkar.category,
        iconPath: "assets/icons/backArrow.png",
        onPressedLeading: () => Get.back(),
      ),
      body: SingleChildScrollView(
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemCount: azhkar.array.length,
          itemBuilder: (context, index) => index % 2 == 0
              ? FadeInLeftBig(
                  duration: const Duration(milliseconds: 1200),
                  child: _buildAzhkarCard(index),
                )
              : FadeInRightBig(
                  duration: const Duration(milliseconds: 1200),
                  child: _buildAzhkarCard(index),
                ),
        ),
      ),
    );
  }

  BuildGeneralCard _buildAzhkarCard(int index) {
    return BuildGeneralCard(
        height: 250,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 16,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(azhkar.array[index].text,
                  maxLines: 8,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.amiri(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: AppColors.kWitheColor))),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    AudioplayersHelper.play(path: azhkar.array[index].audio);
                  },
                  child: const CircleAvatar(
                    radius: 24,
                    backgroundColor: AppColors.kPurpleD2Color,
                    child: Icon(
                      Icons.play_arrow,
                      color: AppColors.kWitheColor,
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
