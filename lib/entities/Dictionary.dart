class Dictionary {
  int id;
  String word;
  String description;

  Dictionary({this.id, this.word, this.description});

  Dictionary.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.word = map['word'];
    this.description = map['description'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'word': word,
      'description': description,
    };
  }

  static Dictionary fromJson(json) {
    var object = new Dictionary();
    object.id = int.parse(json['id']);
    object.word = json['word'];
    object.description = json['description'];
    return object;
  }
}