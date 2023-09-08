import 'package:quran_app/util/app_color.dart';
import 'package:quran_app/util/global_variables.dart';

import '../../../models/adhkar_model.dart';
import '../../../common/widgets/general_card.dart';
import 'azhkar_details_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class AzhkarScreen extends StatefulWidget {
  const AzhkarScreen({super.key});

  @override
  State<AzhkarScreen> createState() => _AzhkarScreenState();
}

class _AzhkarScreenState extends State<AzhkarScreen> {
  List<dynamic> searchedList = [];
  TextEditingController _textEditingController = TextEditingController();
  bool isSearch = false;

  @override
  void initState() {
    super.initState();
    searchedList = adhkars;
  }

  void _runFilter(String value) {
    List<Adhkar> results = [];
    if (value.isEmpty || _textEditingController.text.isEmpty) {
      results = adhkars;
    } else {
      results = adhkars
          .where((adhkar) =>
              adhkar.category.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
    setState(() {
      searchedList = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Image.asset("assets/icons/menu.png"),
        ),
        title: _buildAppBarTitle(),
        actions: _buildAppBarActions(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemCount: searchedList.length,
            itemBuilder: (context, index) => index % 2 == 0
                ? FadeInLeftBig(
                    duration: const Duration(milliseconds: 1200),
                    child: _buildAzhkarCard(index))
                : FadeInRightBig(
                    duration: const Duration(milliseconds: 1200),
                    child: _buildAzhkarCard(index)),
          ),
        ),
      ),
    );
  }

  GestureDetector _buildAzhkarCard(int index) {
    return GestureDetector(
      onTap: () {
        Get.to(AzhkarDetailsScreen(azhkar: searchedList[index]),
            transition: Transition.zoom);
      },
      child: BuildGeneralCard(
        height: 200,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // const SizedBox(height: 8),
              Row(children: [
                Image.asset(
                  "assets/icons/book.png",
                  width: 20,
                  height: 20,
                ),
                const SizedBox(width: 8),
                Text("Azhkar",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: AppColors.kWitheColor))),
              ]),
              Text(searchedList[index].category,
                  style: GoogleFonts.amiri(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: AppColors.kWitheColor))),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBarTitle() {
    if (isSearch) {
      return _buildSearchFelid();
    } else {
      return Text("Quran App",
          style: GoogleFonts.poppins(
              textStyle: Theme.of(context).textTheme.titleMedium));
    }
  }

  List<Widget> _buildAppBarActions() {
    if (isSearch) {
      return [
        IconButton(
            onPressed: () {
              // toDo: StopSearched
              _clearSearched();
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.clear,
              color: AppColors.kTextMediumColor,
            )),
        _changeTheme()
      ];
    } else {
      return [
        IconButton(
            onPressed: () {
              // toDo: StartSearched
              _startSearched();
            },
            icon: const Icon(
              Icons.search,
              color: AppColors.kTextMediumColor,
            )),
        _changeTheme()
      ];
    }
  }

  Widget _buildSearchFelid() {
    return TextField(
      controller: _textEditingController,
      onChanged: (searchedChar) {
        // addAtSearchedList(searchedChar);
        _runFilter(searchedChar);
      },
      cursorColor: AppColors.kTextMediumColor,
      style: const TextStyle(color: AppColors.kTextMediumColor),
      decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: "Search Here",
          helperStyle: TextStyle(color: AppColors.kTextLight2Color)),
    );
  }

  void _startSearched() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearched));
    setState(() => isSearch = true);
  }

  void _stopSearched() {
    _clearSearched();
    setState(() => isSearch = false);
  }

  void _clearSearched() {
    setState(() => _textEditingController.clear());
  }

  IconButton _changeTheme() {
    return IconButton(
      onPressed: () {
        Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
        debugPrint(Get.isDarkMode.toString());
        setState(() {}); // bool
      },
      icon: Get.isDarkMode
          ? const Icon(
              Icons.dark_mode,
              color: AppColors.kTextDarkColor,
            )
          : const Icon(
              Icons.light_mode,
              color: AppColors.kTextMediumColor,
            ), //: Icons.light_mode,
    );
  }

  Column _buildIntroText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Asslamualaikum",
            style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: AppColors.kTextMediumColor))),
        const SizedBox(height: 4),
        Text("Tanvir Ahassan",
            style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    color: AppColors.kPurpleD6Color))),
      ],
    );
  }
}
