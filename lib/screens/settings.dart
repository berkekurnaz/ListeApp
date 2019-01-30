import 'package:flutter/material.dart';
import 'package:Liste/db/dbHelper.dart';

class Settings extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _SettingsState();
}

class _SettingsState extends State<Settings>{
  
  DbHelper dbHelper = new DbHelper();

  String validateText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ayarlar"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text("Ayarlar", style: TextStyle(fontSize: 25),),
              Divider(color: Colors.black, height: 10.0,),
              Text("Bütün Listeyi Silmek İstediğiniz Zaman Aşağıdaki Butonu Kullanabilirsiniz.", textAlign: TextAlign.center, style: TextStyle(fontSize: 20),),
              Divider(color: Colors.white, height: 20.0,),
              ButtonTheme(
                minWidth: 200.0,
                height: 50.0,
                child: RaisedButton(
                  child: Text("Bütün Listeyi Sil"),
                  textColor: Colors.white,
                  color: Colors.red,
                  elevation: 4.0,
                  splashColor: Colors.redAccent,
                  onPressed: () {
                    deleteAllNotes();
                  },
                ),
              ),
              Divider(color: Colors.white, height: 20.0,),
              Divider(color: Colors.black, height: 10.0,),

              Text("$validateText", style: TextStyle(color: Colors.red),),

            ],
          ),
        ),
      ),
    );
  }

  void deleteAllNotes() async{
    int result = await dbHelper.deleteAllNotes();
      if (result != 0) {
        Navigator.pushNamed(context, "/main");
      }else{
        setState(() {
          validateText = "Liste Boş Olduğu İçin Silme İşlemi Yapılmıyor";
        });
      }
  }
  
}