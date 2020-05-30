import 'dart:async';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:latihan_api/configs/constants.dart';
import 'package:latihan_api/entities/Item.dart';

class Mitem {
  Future<Item> selectById(int id) async {
    var url = apiUrlAddress + "index.php/myapi/item_api?id" + id.toString();

    final response = await http.get(url);

    List<Item> objectList;
    objectList = (json.decode(response.body) as List)
        .map((i) => Item.fromJson(i))
        .toList();

    if (objectList[0] == null) {
      return null;
    } else {
      return objectList[0];
    }
  }

  Future<int> insert(Item _object) async {
    var url = apiUrlAddress + "index.php/myapi/item_api";
    http.post(url, body: {
      "item_code": _object.item_code,
      "item_name": _object.item_name,
      "price": _object.price,
      "stock": _object.stock
    });
    return 1;
  }

  Future<int> update(Item _object) async {
    var url = apiUrlAddress + "index.php/myapi/item_api";
    http.put(url, body: {
      "id": _object.id.toString(),
      "item_code": _object.item_code,
      "item_name": _object.item_name,
      "price": _object.price,
      "stock": _object.stock
    });
    return 0;
  }

  Future<int> delete(int id) async {
    var url = apiUrlAddress + "index.php/myapi/item_api_delete";
    http.post(url, body: {'id': id});
    return 0;
  }

  Future<List<Item>> getList() async {
    var url = apiUrlAddress + "index.php/myapi/item_api";
    final response = await http.get(url);

    List<Item> objectList;
    objectList = (json.decode(response.body) as List)
        .map((i) => Item.fromJson(i))
        .toList();
    return objectList;
  }

  Future isReady() async {
    return true;
  }
}
