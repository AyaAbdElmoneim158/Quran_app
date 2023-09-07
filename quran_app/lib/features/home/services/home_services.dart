import '../../../models/quran_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeService {
  static Box box = Hive.box<QuranModel>("favorites_box");
  static Future<void> addFavorite(QuranModel quranModel) async {
    box.add(quranModel);
  }

  static Future<void> removeFavorite(String title) async {
    box.delete(title);
  }

  static List<dynamic> getFavorites() {
    return box.values.toList();
  }

  static bool isFavorite(String ayetAudio) {
    return box.containsKey(ayetAudio);
  }

  static void clearFavorites() {
    box.clear();
  }

  static Future<void> deleteFavorite(String title) async {
    box.delete(title);
  }
  /*

  static Future<void> updateFavorite(String title, String url) async {
    box.put(title, url);
  }

  

  static Future<void> deleteAllFavorites() async {
    box.clear();
  }

  static Future<void> updateAllFavorites(Map<String, String> map) async {
    box.putAll(map);
  }

  static Future<void> updateAllFavoritesFromList(List<String> list) async {
    box.putAll(list);
  }

  static Future<void> deleteAllFavoritesFromList(List<String> list) async {
    box.deleteAll(list);
  }

  static Future<void> updateAllFavoritesFromMap(Map<String, String> map) async {
    box.putAll(map);
  }

  static Future<void> deleteAllFavoritesFromMap(Map<String, String> map) async {
    box.deleteAll(map);
  }

  static Future<void> deleteAllFavoritesFromListAndMap(
      List<String> list, Map<String, String> map) async {
    box.deleteAll(list);
    box.putAll(map);
  }

  static Future<void> updateAllFavoritesFromListAndMap(
      List<String> list, Map<String, String> map) async {
    box.putAll(list);
    box.putAll(map);
  }

  static Future<void> updateAllFavoritesFromMapAndList(
      Map<String, String> map, List<String> list) async {
    box.putAll(map);
    box.putAll(list);
  }

  static Future<void> deleteAllFavoritesFromMapAndList(
      Map<String, String> map, List<String> list) async {
    box.deleteAll(map);
    box.deleteAll(list);
  }

  static Future<void> deleteAllFavoritesFromListAndMapAndList(
      List<String> list, Map<String, String> map, List<String> list2) async {
    box.deleteAll(list);
    box.putAll(map);
    box.deleteAll(list2);
  }

  static Future<void> updateAllFavoritesFromListAndMapAndList(
      List<String> list, Map<String, String> map, List<String> list2) async {
    box.putAll(list);
    box.putAll(map);
    box.putAll(list2);
  }

  static Future<void> updateAllFavoritesFromMapAndListAndList(
      Map<String, String> map, List<String> list, List<String> list2) async {
    box.putAll(map);
    box.putAll(list);
    box.putAll(list2);
  }

  static Future<void> deleteAllFavoritesFromMapAndListAndList(
      Map<String, String> map, List<String> list, List<String> list2) async {
    box.deleteAll(map);
    box.deleteAll(list);
    box.deleteAll(list2);
  }

  static Future<void> deleteAllFavoritesFromListAndMapAndListAndList(
      List<String> list,
      Map<String, String> map,
      List<String> list2,
      List<String> list3) async {
    box.deleteAll(list);
    box.putAll(map);
    box.deleteAll(list2);
    box.deleteAll(list3);
  }

  static Future<void> updateAllFavoritesFromListAndMapAndListAndList(
      List<String> list,
      Map<String, String> map,
      List<String> list2,
      List<String> list3) async {}
      
  static Future<void> updateAllFavoritesFromMapAndListAndListAndList()
  async {}
  */
}
