class Hadith {
  Hadith({
    required this.category,
    required this.array,
  });
  late final String category;
  late final List<Array> array;

  Hadith.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    array = List.from(json['array']).map((e) => Array.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['category'] = category;
    _data['array'] = array.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Array {
  Array({
    required this.number,
    required this.hadith,
    required this.description,
    required this.searchTerm,
  });
  late final int number;
  late final String hadith;
  late final String description;
  late final String searchTerm;

  Array.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    hadith = json['hadith'];
    description = json['description'];
    searchTerm = json['searchTerm'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['number'] = number;
    _data['hadith'] = hadith;
    _data['description'] = description;
    _data['searchTerm'] = searchTerm;
    return _data;
  }
}
