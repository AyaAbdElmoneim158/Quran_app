import 'package:quran_app/util/app_color.dart';
import 'package:quran_app/util/global_variables.dart';

import '../../models/surah_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key,
      this.title = "Quran App",
      this.onPressedSearch,
      this.onPressedLeading,
      this.iconPath = "assets/icons/menu.png",
      required this.searchedList});

  final String title;
  final void Function()? onPressedSearch;
  final void Function()? onPressedLeading;
  final String iconPath;
  final List<dynamic> searchedList;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(56);
}

class _CustomAppBarState extends State<CustomAppBar> {
  List<dynamic> searchedList = [];
  TextEditingController _textEditingController = TextEditingController();
  bool isSearch = false;

  Widget _buildAppBarTitle() {
    if (isSearch) {
      return _buildSearchFelid();
    } else {
      return Text(widget.title,
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
        addAtSearchedList(searchedChar);
      },
      cursorColor: AppColors.kTextMediumColor,
      style: const TextStyle(color: AppColors.kTextMediumColor),
      decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: "Search Here",
          helperStyle: TextStyle(color: AppColors.kTextLight2Color)),
    );
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

  void addAtSearchedList(String value) {
    // searchedList = widget.searchedList
    //     .where((ele) => ele.name.toLowerCase().startsWith(searchedChar))
    //     .toList();
    // setState(() {});
    List<SurahModel> results = [];
    if (value.isEmpty) {
      results = surahList;
    } else {
      results = surahList
          .where((surah) =>
              surah.nameTranslation.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
    setState(() {
      searchedList = results;
    });
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

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        onPressed: widget.onPressedLeading,
        icon: Image.asset(widget.iconPath),
      ),
      title: _buildAppBarTitle(),
      actions: _buildAppBarActions(),
    );
  }
}


 /* [
        IconButton(
          onPressed: widget.onPressedSearch,
          icon: Image.asset("assets/icons/search.png"),
        ),
        IconButton(
          onPressed: () {
            Get.changeThemeMode(
                Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
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
        )
      ],*/