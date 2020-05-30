import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:latihan_api/configs/constants.dart';
import 'dart:convert';

import 'package:latihan_api/entities/Dictionary.dart';

class Mdictionary {
  Future<Dictionary> selectById(int id) async {
    var url = apiUrlAddress + "index.php/myapi/kamus_api?id" + id.toString();

    final response = await http.get(url);

    List<Dictionary> objectList;
    objectList = (json.decode(response.body) as List)
        .map((i) => Dictionary.fromJson(i))
        .toList();

    if (objectList[0] == null) {
      return null;
    } else {
      return objectList[0];
    }
  }

  Future<int> insert(Dictionary _object) async {
    var url = apiUrlAddress + "index.php/myapi/kamus_api";

    http.post(url,
        body: {"word": _object.word, "description": _object.description});

    return 1;
  }

  Future<int> update(Dictionary _object) async {
    var url = apiUrlAddress + "index.php/myapi/kamus_api";
    http.put(url, body: {
      "id": _object.id.toString(),
      "word": _object.word,
      "description": _object.description
    });

    return 0;
  }

  Future<int> delete(int id) async {
    var url = apiUrlAddress + "index.php/myapi/kamus_api_delete";

    http.post(url, body: {'id': id});
    return 0;
  }

  Future<List<Dictionary>> getList() async {
    var url = apiUrlAddress + "index.php/myapi/kamus_api";
    final response = await http.get(url);

    List<Dictionary> objectList;
    objectList = (json.decode(response.body) as List)
        .map((i) => Dictionary.fromJson(i))
        .toList();

    return objectList;
  }

  Future isReady() async {
    return true;
  }
}
