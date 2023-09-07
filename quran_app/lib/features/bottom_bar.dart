// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentIndex = 0;
  List<Widget> screens = [
    // const HomeScreen(),
    // const HadithScreen(),
    // const AzhkarScreen(),
    const Center(child: Text("1", style: TextStyle(fontSize: 24))),
    const Center(child: Text("2", style: TextStyle(fontSize: 24))),
    const Center(child: Text("3", style: TextStyle(fontSize: 24))),
    const Center(child: Text("4", style: TextStyle(fontSize: 24))),
    const Center(child: Text("5", style: TextStyle(fontSize: 24))),
    // const Center(child: Text("BookmarkScreen", style: TextStyle(fontSize: 24))),
    // const BookmarkScreen()
  ];

  @override
  void initState() {
    super.initState();
    // final args = ModalRoute.of(context)!.settings.arguments;
    // debugPrint(args.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBar(
      //     searchedList: (currentIndex == 0)
      //         ? surahList
      //         : (currentIndex == 1)
      //             ? hadithsList
      //             : (currentIndex == 2)
      //                 ? adhkars
      //                 : [] //adhkars
      //     ),
      bottomNavigationBar: _buildBottomBar(),
      body: screens[currentIndex],
    );
  }

  Container _buildBottomBar() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, -4),
              spreadRadius: 0,
              blurRadius: 16,
              color: const Color(0xffBAB0CE).withOpacity(0.2))
        ],
      ),
      child: BottomNavigationBar(
        items: items(),
        currentIndex: currentIndex,
        onTap: (value) => setState(() => currentIndex = value),
      ),
    );
  }

  List<BottomNavigationBarItem> items() => [
        BottomNavigationBarItem(
            icon: Image.asset(currentIndex == 0
                ? "assets/icons/quran_purple.png"
                : "assets/icons/quran_gray.png"),
            label: ""),
        // BottomNavigationBarItem(
        //     icon: Image.asset(currentIndex == 1
        //         ? "assets/icons/ideal_purple.png"
        //         : "assets/icons/ideal_gray.png"),
        //     label: ""),
        BottomNavigationBarItem(
            icon: Image.asset(currentIndex == 1
                ? "assets/icons/prayer_purple.png"
                : "assets/icons/prayer_gray.png"),
            label: ""),
        BottomNavigationBarItem(
            icon: Image.asset(currentIndex == 2
                ? "assets/icons/pray_purple.png"
                : "assets/icons/pray_gray.png"),
            label: ""),
        BottomNavigationBarItem(
            icon: Image.asset(currentIndex == 3
                ? "assets/icons/bookmark_purple.png"
                : "assets/icons/bookmark_gray.png"),
            label: ""),
      ];
}
