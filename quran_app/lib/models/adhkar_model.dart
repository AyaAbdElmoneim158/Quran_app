class Adhkar {
  Adhkar({
    required this.category,
    required this.array,
  });
  late final String category;
  late final List<Array> array;

  Adhkar.fromJson(Map<String, dynamic> json) {
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
    required this.text,
    required this.audio,
  });
  late final String text;
  late final String audio;

  Array.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    audio = json['audio'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['text'] = text;
    _data['audio'] = audio;
    return _data;
  }
}
