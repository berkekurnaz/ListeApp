import 'package:flutter/material.dart';
import 'package:Liste/db/dbHelper.dart';
import 'package:Liste/models/mylist.dart';

class ListAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ListAddState();
}

DateTime now = DateTime.now();

class _ListAddState extends State<ListAdd> {
  DbHelper dbHelper = new DbHelper();

  TextEditingController txtTitle = new TextEditingController();

  String createDate = "${now.day}.${now.month}.${now.year}";

  String validateText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Ekleme Sayfası"),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: txtTitle,
              decoration: InputDecoration(labelText: "Başlık"),
            ),
            Divider(
              color: Colors.white,
              height: 20.0,
            ),
            Text("$validateText", style: TextStyle(color: Colors.black),),
            ButtonTheme(
              minWidth: 200.0,
              height: 50.0,
              child: RaisedButton(
                child: Text("Ekle"),
                textColor: Colors.white,
                color: Colors.blue,
                elevation: 4.0,
                splashColor: Colors.blueGrey,
                onPressed: () {
                  save();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void save() async {
    if (txtTitle.text.length >= 2 && txtTitle.text.length <= 30) {
      int result = await dbHelper.insert(MyList(txtTitle.text, createDate, "Hayır"));
      validateText = "";
      if (result != 0) {
        Navigator.pop(context, true);
      }
    }else{
      setState(() {
              validateText = "* 2 Karakter Ve 30 Karakter Arası Olmalıdır...";
      });
    }
  }
  
}
