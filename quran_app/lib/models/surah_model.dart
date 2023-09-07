class SurahModel {
  SurahModel({
    required this.id,
    required this.name,
    required this.nameEn,
    required this.nameTranslation,
    required this.words,
    required this.letters,
    required this.type,
    required this.typeEn,
    required this.ar,
    required this.en,
    required this.array,
  });
  late final int id;
  late final String name;
  late final String nameEn;
  late final String nameTranslation;
  late final int words;
  late final int letters;
  late final String type;
  late final String typeEn;
  late final String ar;
  late final String en;
  late final List<Array> array;

  SurahModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameEn = json['name_en'];
    nameTranslation = json['name_translation'];
    words = json['words'];
    letters = json['letters'];
    type = json['type'];
    typeEn = json['type_en'];
    ar = json['ar'];
    en = json['en'];
    array = List.from(json['array']).map((e) => Array.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['name_en'] = nameEn;
    _data['name_translation'] = nameTranslation;
    _data['words'] = words;
    _data['letters'] = letters;
    _data['type'] = type;
    _data['type_en'] = typeEn;
    _data['ar'] = ar;
    _data['en'] = en;
    _data['array'] = array.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Array {
  Array({
    required this.id,
    required this.ar,
    required this.en,
    required this.filename,
    required this.path,
    required this.dir,
    required this.size,
  });
  late final int id;
  late final String ar;
  late final String en;
  late final String filename;
  late final String path;
  late final String dir;
  late final int size;

  Array.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ar = json['ar'];
    en = json['en'];
    filename = json['filename'];
    path = json['path'];
    dir = json['dir'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['ar'] = ar;
    _data['en'] = en;
    _data['filename'] = filename;
    _data['path'] = path;
    _data['dir'] = dir;
    _data['size'] = size;
    return _data;
  }
}
