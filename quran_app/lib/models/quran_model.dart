import 'package:hive/hive.dart';
part 'quran_model.g.dart';

@HiveType(typeId: 0)
class QuranModel extends HiveObject {
  @HiveField(0)
  late final String name;
  @HiveField(1)
  late final String nameTranslation;
  @HiveField(2)
  late final String ayet;
  @HiveField(3)
  late final String ayetAudio;

  QuranModel(
      {required this.name,
      required this.nameTranslation,
      required this.ayet,
      required this.ayetAudio});
}
