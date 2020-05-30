import 'package:flutter/material.dart';
import 'package:latihan_api/entities/Item.dart';

import 'dart:async';

import 'package:latihan_api/models/Mitem.dart';
import 'package:latihan_api/ui/fragment/MenuFragment.dart';

import 'ItemInputPage.dart';

class ItemIndexPage extends StatefulWidget {
  @override
  ItemIndexPageState createState() => ItemIndexPageState();
}

class ItemIndexPageState extends State<ItemIndexPage> {
  var _mitem = new Mitem();
  int count = 0;
  List<Item> itemList;
  @override
  Widget build(BuildContext context) {
    if (itemList == null) {
      itemList = List<Item>();
    }
    Future.microtask(() {
      this.updateListView();
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('List Item'),
      ),
      drawer: MenuFragment(),
      body: createListView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'Tambah Data',
        onPressed: () async {
          var contact = await pushAndGetFormInputResult(context, null);
          if (contact != null) addData(contact);
        },
      ),
    );
  }

  Future<Item> pushAndGetFormInputResult(
      BuildContext context, Item contact) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return ItemInputPage(contact);
    }));
    return result;
  }

  ListView createListView() {
    TextStyle textStyle = Theme.of(context).textTheme.subhead;
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: Icon(
              Icons.person,
              size: 45,
            ),
            title: Text(
              this.itemList[index].item_code,
              style: textStyle,
            ),
            subtitle: Text(this.itemList[index].item_code),
            trailing: GestureDetector(
              child: Icon(Icons.delete),
              onTap: () {
                deleteData(itemList[index]);
              },
            ),
            onTap: () async {
              var contact = await pushAndGetFormInputResult(
                  context, this.itemList[index]);
              if (contact != null) editData(contact);
            },
          ),
        );
      },
    );
  }

  void addData(Item object) async {
    int result = await _mitem.insert(object);
    if (result > 0) {
      updateListView();
    }
  }

  void editData(Item object) async {
    int result = await _mitem.update(object);
    if (result > 0) {
      updateListView();
    }
  }

  void deleteData(Item object) async {
    int result = await _mitem.delete(object.id);
    if (result > 0) {
      updateListView();
    }
  }

  void updateListView() {
    Future<List<Item>> itemListFuture = _mitem.getList();
    itemListFuture.then((resultList) {
      setState(() {
        this.itemList = resultList;
        this.count = resultList.length;
      });
    });
  }
}
