import 'package:flutter/material.dart';
import 'package:latihan_api/entities/Item.dart';

class ItemInputPage extends StatefulWidget {
  final Item _item;
  ItemInputPage(this._item);

  @override
  ItemInputPageState createState() => ItemInputPageState(this._item);
}

class ItemInputPageState extends State<ItemInputPage> {
  final _formKey = GlobalKey<FormState>();
  Item _item;
  ItemInputPageState(this._item);
  var item_codeController = TextEditingController();
  var item_nameController = TextEditingController();
  var priceController = TextEditingController();
  var stockController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (_item != null) {
      item_codeController.text = _item.item_code;
      item_nameController.text = _item.item_name;
      priceController.text = _item.price;
      stockController.text = _item.stock;
    }
    return Scaffold(
        appBar: AppBar(
          title: _item == null ? Text('Tambah') : Text('Ubah'),
          leading: Icon(Icons.keyboard_arrow_left),
        ),
        body: new Container(
          padding: new EdgeInsets.all(20.0),
          child: new Form(
            key: _formKey,
            child: new ListView(
              children: <Widget>[
                new TextFormField(
                  controller: item_codeController,
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(labelText: 'Item_Code'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Mohon Input Item_Code';
                    }
                    return null;
                  },
                ),
                new TextFormField(
                  controller: item_nameController,
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(labelText: 'Item_Name'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Mohon Input Item_Name';
                    }
                    return null;
                  },
                ),
                new TextFormField(
                  controller: priceController,
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(labelText: 'Price'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Mohon Input Price';
                    }
                    return null;
                  },
                ),
                new TextFormField(
                  controller: stockController,
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(labelText: 'Stock'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Mohon Input Stock';
                    }
                    return null;
                  },
                ),
                new Container(
                  child: new RaisedButton(
                    child: new Text(
                      'Submit',
                      style: new TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        if (_item == null) {
                          _item = new Item(
                              id: 0,
                              item_code: item_codeController.text,
                              item_name: item_nameController.text,
                              price: priceController.text,
                              stock: stockController.text);
                        } else {
                          _item.item_code = item_codeController.text;
                          _item.item_name = item_nameController.text;
                          _item.price = priceController.text;
                          _item.stock = stockController.text;
                        }
                        Navigator.pop(context, _item);
                      }
                    },
                    color: Colors.blue,
                  ),
                  margin: new EdgeInsets.only(top: 20.0),
                )
              ],
            ),
          ),
        ));
  }
}
