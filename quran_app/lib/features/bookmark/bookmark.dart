import 'package:quran_app/util/app_color.dart';

import '../home/services/home_services.dart';
import '../../util/audioplayers_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  List<dynamic> _bookmarks = [];
  @override
  void initState() {
    super.initState();
    _bookmarks = HomeService.getFavorites();
    print(_bookmarks.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Your bookmark",
            style: GoogleFonts.poppins(
                textStyle: Theme.of(context).textTheme.titleMedium),
          ),
          leading: Container(),
          // const BackButton(color: AppColors.kPurpleD3Color),
          actions: [
            IconButton(
                onPressed: () {
                  HomeService.clearFavorites();
                  _bookmarks = HomeService.getFavorites();
                  print(_bookmarks.length);
                  setState(() {});
                },
                icon: const Icon(
                  Icons.clear,
                  color: AppColors.kPurpleD1Color,
                ))
          ],
        ),
        body: _bookmarks.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                        "https://img.icons8.com/?size=1x&id=102721&format=png"),
                    const SizedBox(height: 8),
                    Text("Bookmark is Empty",
                        style: GoogleFonts.poppins(
                            textStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ))),
                  ],
                ),
              )
            : ListView.builder(
                itemCount: _bookmarks.length,
                itemBuilder: (context, index) => _buildBookmark(index))
        // _buildBookmark();,
        );
  }

  Widget _buildBookmark(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 16,
      ),
      child: Column(
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
                          AudioplayersHelper.play(
                              path: _bookmarks[index].ayetAudio);
                        },
                        child: Image.asset("assets/icons/play.png"),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          _bookmarks[index].delete();

                          // HomeService.deleteFavorite(
                          //     _bookmarks[index].ayetAudio);
                          // print("deleted favorite");
                          // var bookmarks = HomeService.getFavorites();
                          // print(bookmarks.length);
                        },
                        child: Image.asset("assets/icons/bookmark.png"),
                      )
                    ],
                  ),
                  Text("${_bookmarks[index].ayet}",
                      style: GoogleFonts.poppins(
                          textStyle: Theme.of(context).textTheme.labelLarge!)),
                ],
              )),
          const SizedBox(height: 24),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(_bookmarks[index].name,
                  style: GoogleFonts.amiri(
                      textStyle: Theme.of(context).textTheme.bodySmall,
                      fontSize: 18)),
            ),
          ),
          const SizedBox(height: 24),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(_bookmarks[index].nameTranslation,
                style: GoogleFonts.poppins(
                    textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: AppColors.kTextDarkColor, fontSize: 16))),
          ),
          const SizedBox(height: 24),
          Divider(
              height: 1,
              color: AppColors.kTextLight2Color.withOpacity(0.35),
              thickness: 1),
        ],
      ),
    );
  }
}
