import 'jsons/abi_daud.dart';
import 'jsons/adhkar.dart';
import 'jsons/ahmed.dart';
import 'jsons/bukhari.dart';
import 'jsons/darimi.dart';
import 'jsons/ibn_maja.dart';
import 'jsons/malik.dart';
import 'jsons/muslim.dart';
import 'jsons/nasai.dart';
import 'jsons/trmizi.dart';
import '../models/adhkar_model.dart';
import '../models/hadith_model.dart';
import '../models/surah_model.dart';
import 'jsons/Quran.dart';

List<SurahModel> surahList =
    quran.map((ele) => SurahModel.fromJson(ele)).toList();

var hadiths = [
  {
    "category": " احاديث ابي داود", //  Hadiths of Abu Dawood
    "array": abiDaud
  },
  {
    "category": " احاديث أحمد ", //  Hadiths of Abu Dawood
    "array": ahmed
  },
  {
    "category": " احاديث البخاري", //  Hadiths of Abu Dawood
    "array": bukhari
  },
  {
    "category": " احاديث درايمي ", //  Hadiths of Abu Dawood
    "array": darimi
  },
  {
    "category": " احاديث ابن ماجي", //  Hadiths of Abu Dawood
    "array": ibnMaja
  },
  {
    "category": " احاديث مالك ", //  Hadiths of Abu Dawood
    "array": malik
  },
  {
    "category": " احاديث مسلم", //  Hadiths of Abu Dawood
    "array": muslim
  },
  {
    "category": " احاديث نساءي ", //  Hadiths of Abu Dawood
    "array": nasai
  },
  {
    "category": " احاديث تلميز ", //  Hadiths of Abu Dawood
    "array": trmizi
  }
];
List<Hadith> hadithsList = hadiths.map((ele) => Hadith.fromJson(ele)).toList();
List<Adhkar> adhkars = adhkar.map((ele) => Adhkar.fromJson(ele)).toList();
