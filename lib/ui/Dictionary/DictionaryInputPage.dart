import 'package:flutter/material.dart';
import 'package:latihan_api/entities/Dictionary.dart';

class DictionaryInputPage extends StatefulWidget {
  final Dictionary _dictionary;
  DictionaryInputPage(this._dictionary);

  @override
  DictionaryInputPageState createState() =>
      DictionaryInputPageState(this._dictionary);
}

class DictionaryInputPageState extends State<DictionaryInputPage> {
  final _formKey = GlobalKey<FormState>();
  Dictionary _dictionary;
  DictionaryInputPageState(this._dictionary);
  var wordController = TextEditingController();
  var descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (_dictionary != null) {
      wordController.text = _dictionary.word;
      descriptionController.text = _dictionary.description;
    }
    return Scaffold(
        appBar: AppBar(
          title: _dictionary == null ? Text('Tambah') : Text('Ubah'),
          leading: Icon(Icons.keyboard_arrow_left),
        ),
        body: new Container(
          padding: new EdgeInsets.all(20.0),
          child: new Form(
            key: _formKey,
            child: new ListView(
              children: <Widget>[
                new TextFormField(
                  controller: wordController,
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(labelText: 'Word'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Mohon input Word';
                    }
                    return null;
                  },
                ),
                new TextFormField(
                  controller: descriptionController,
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(labelText: 'Description'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Mohon input Description';
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
                        if (_dictionary == null) {
                          _dictionary = new Dictionary(
                              id: 0,
                              word: wordController.text,
                              description: descriptionController.text);
                        } else {
                          _dictionary.word = wordController.text;
                          _dictionary.description = descriptionController.text;
                        }
                        Navigator.pop(context, _dictionary);
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
