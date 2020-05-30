import 'package:flutter/material.dart';
import 'package:latihan_api/ui/DefaultPage.dart';
import 'package:latihan_api/ui/Dictionary/DictionaryIndexPage.dart';
import 'package:latihan_api/ui/Home/HomeIndexPage.dart';
import 'package:latihan_api/ui/Item/ItemIndexPage.dart';
import 'package:latihan_api/ui/Login/LoginIndexPage.dart';

final routesMap = {
  '/': (BuildContext context) => new DefaultPage(),
  '/Login': (BuildContext context) => new LoginIndexPage(),
  '/Home': (BuildContext context) => new HomeIndexPage(),
  '/Dictionary': (BuildContext context) => new DictionaryIndexPage(),
  '/Item': (BuildContext context) => new ItemIndexPage(),
};
