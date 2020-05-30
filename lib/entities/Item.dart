class Item {
  int id;
  String item_code;
  String item_name;
  String price;
  String stock;

  Item({this.id,this.item_code,this.item_name, this.price, this.stock});

  Item.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.item_code = map['item_code'];
    this.item_name = map['item_name'];
    this.price = map['price'];
    this.stock = map['stock'];
  }

  String get description => null;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'item_code': item_code,
      'item_name': item_name,
      'price': price,
      'stock': stock
    };
  }

  static Item fromJson(json) {
    var object = new Item();
    object.id = int.parse(json['id']);
    object.item_code = json['item_code'];
    object.item_name = json['item_name'];
    object.price = json['price'];
    object.stock = json['stock'];
    return object;
  }
}