import 'package:flutter/material.dart';
import 'package:Liste/db/dbHelper.dart';
import 'package:Liste/models/mylist.dart';
import 'package:Liste/screens/getMyList.dart';

class ListDetail extends StatefulWidget {
  MyList myList;
  ListDetail(this.myList);

  @override
  State<StatefulWidget> createState() => _ListDetailState(myList);
}

DbHelper dbHelper = new DbHelper();

class _ListDetailState extends State<ListDetail> {
  MyList myList;
  _ListDetailState(this.myList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detay Sayfası"),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text("Başlık\n\n${myList.title}"),
                leading: Icon(Icons.title),
              ),
              Divider(
                color: Colors.black,
              ),
              ListTile(
                title: Text("Eklenme Tarihi\n\n${myList.date}"),
                leading: Icon(Icons.date_range),
              ),
              Divider(
                color: Colors.black,
              ),
              ListTile(
                title: Text("Tamamlanma Durumu\n\n${myList.completed}"),
                leading: Icon(Icons.star_border),
              ),
              Divider(
                color: Colors.black,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: ButtonTheme(
                      minWidth: 200.0,
                      height: 50.0,
                      child: RaisedButton(
                        child: Text("Durum Değiştir"),
                        textColor: Colors.white,
                        color: Colors.green,
                        elevation: 4.0,
                        splashColor: Colors.blueGrey,
                        onPressed: () {
                          String durum = "";
                          if(myList.completed == "Evet"){
                            durum = "Hayır";
                          }else{
                            durum = "Evet";  
                          }
                          MyList updateList = MyList.fromObject({"Id": myList.id, "Title": myList.title, "Date": myList.date, "Completed": durum});
                          update(updateList);
                        },
                      ),
                    ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: ButtonTheme(
                      minWidth: 200.0,
                      height: 50.0,
                      child: RaisedButton(
                        child: Text("Listeden Sil"),
                        textColor: Colors.white,
                        color: Colors.red,
                        elevation: 4.0,
                        splashColor: Colors.blueGrey,
                        onPressed: () {
                          delete(myList.id);
                        },
                      ),
                    ),
                    ),
                  ),
                ],
              ),
              ButtonTheme(
                minWidth: 200.0,
                height: 50.0,
                child: RaisedButton(
                  child: Text("Geri Dön"),
                  textColor: Colors.white,
                  color: Colors.blue,
                  elevation: 4.0,
                  splashColor: Colors.blueGrey,
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void delete(id) async {
      int result = await dbHelper.delete(id);
      if (result != 0) {
        Navigator.pop(context, true);
      }
  }

  void update(MyList listmy) async{
    int result = await dbHelper.update(listmy);
    if (result != 0) {
      Navigator.pop(context, true);
    }
  }

}
