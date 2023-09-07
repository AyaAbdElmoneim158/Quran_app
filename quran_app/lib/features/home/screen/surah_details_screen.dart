import '../../../common/widgets/custom_app_bar.dart';
import '../widgets/surah_info_card.dart';
import '../widgets/verse_card.dart';
import '../../../models/surah_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SurahDetailsScreen extends StatelessWidget {
  const SurahDetailsScreen({super.key, required this.surah});
  final SurahModel surah;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        searchedList: [],
        title: surah.nameTranslation,
        iconPath: "assets/icons/backArrow.png",
        onPressedLeading: () => Get.back(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            children: [
              buildSurahInfoCard(surah),
              const SizedBox(height: 24),
              ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                  itemCount: surah.array.length,
                  itemBuilder: (context, index) =>
                      VerseCard(surah: surah, index: index))
            ],
          ),
        ),
      ),
    );
  }
}
