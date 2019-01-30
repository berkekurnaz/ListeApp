import 'dart:io';

import 'package:flutter/material.dart';
import 'package:Liste/db/dbHelper.dart';
import 'package:Liste/models/mylist.dart';
import 'package:Liste/screens/listAdd.dart';
import 'package:Liste/screens/listDetail.dart';

class GetMyList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _GetMyListState();
}

class _GetMyListState extends State<GetMyList>{
  
  DbHelper dbHelper = new DbHelper();
  List<MyList> myList;
  int count = 0;
  bool checkboxValue;

  @override
  Widget build(BuildContext context) {
    
    if (myList == null) {
      myList = new List<MyList>();
      getData();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Liste"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_circle_outline),
            onPressed: (){
              goToAdd();
            },
          ),
        ],
      ),
      body: mainCenter(myListItems(), count),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          goToAdd();
        },
        tooltip: "Yeni Ekle",
        child: Icon(Icons.add),
      ),
      drawer: new Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Align(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.list),
                    Text("Liste Uygulaması"),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.amberAccent,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Anasayfa'),
              trailing: Icon(Icons.arrow_right),        
              onTap: () {
                Navigator.pushNamed(context, "/main");
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Nedir ?'),
              trailing: Icon(Icons.arrow_right),   
              onTap: () {
                Navigator.pushNamed(context, "/about");
              },
            ),
            ListTile(
              leading: Icon(Icons.settings_input_composite),
              title: Text('Nasıl Kullanılır ?'),
              trailing: Icon(Icons.arrow_right),   
              onTap: () {
                Navigator.pushNamed(context, "/nasilkullanilir");
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Ayarlar'),
              trailing: Icon(Icons.arrow_right),   
              onTap: () {
                Navigator.pushNamed(context, "/settings");
              },
            ),
            ListTile(
              leading: Icon(Icons.call_missed_outgoing),
              title: Text('Çıkış'),
              trailing: Icon(Icons.arrow_right),   
              onTap: () {
                exit(0);
              },
            ),
          ],
        ),
      ),
    );
  }

  Container mainCenter(ListView listView, int count){
    if(count == 0){
      return Container(
        alignment: Alignment.center,
        child: Text("Şu An Listeniz Boş.\nYeni Eklemek İçin Ekleme Butonuna Tıklayabilirsiniz.", textAlign: TextAlign.center,style: TextStyle(fontSize: 20.0),),
      );
    }else{
      return Container(
        child: listView,
      );
    }
  }

  ListView myListItems(){
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position){
        return Card(
          color: Colors.amberAccent,
          elevation: 2.0,
          child: ListTile(
            leading: Icon(Icons.adjust),
            title: Text(this.myList[position].title),
            subtitle: Text(this.myList[position].date),
            trailing: Checkbox(
              value: getStateById(position, checkboxValue),
              onChanged: (bool newValue) {
                  newValue = !getStateById(position, checkboxValue);
                  String durum = "";
                  if(newValue == true){
                    durum = "Evet";
                  }else{
                    durum = "Hayır";
                  }
                  MyList updateList = MyList.fromObject({"Id": this.myList[position].id, "Title":this.myList[position].title, "Date": this.myList[position].date, "Completed": durum});
                  update(updateList);
                setState(() {
                   this.myList[position].completed = durum;
                });
            }),

            onTap: (){
              goToDetail(this.myList[position]);
            },
          ),
        );
      },
    );
  }

  void getData(){
    var dbFuture = dbHelper.initializeDb();
    dbFuture.then((result){
      var listFuture = dbHelper.getMyList();
      listFuture.then((data){
        List<MyList> myListData = new List<MyList>();
        count = data.length;

        for (var i = 0; i < count; i++) {
          myListData.add(MyList.fromObject(data[i]));
        }

        setState(() {
          myList = myListData;
          count = count;  
        });

      });
    });
  }

  void goToDetail(MyList myList) async{
    bool result = await Navigator.push(context, MaterialPageRoute(builder: (context) => ListDetail(myList)));
    if (result != null) {
      if(result){
        getData();
      }
    }
  }

  void goToAdd() async{
    bool result = await Navigator.push(context, MaterialPageRoute(builder: (context) => ListAdd()));
    if (result != null) {
      if(result){
        getData();
      }
    }
  }

  void update(MyList listmy) async{
    int result = await dbHelper.update(listmy);
  }

  bool getStateById(int position, bool checkboxbool){
    if(this.myList[position].completed == "Hayır"){
      checkboxbool = false;
      return false;
    }else{
      checkboxbool = true;
      return true;
    }
  }

  Color getColorById(int position){
    if(this.myList[position].completed == "Hayır"){
      return Colors.red;
    }else{
      return Colors.green;
    }
  }
  
}