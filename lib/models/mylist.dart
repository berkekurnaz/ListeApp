
class MyList{
  
  int _id;
  String _title;
  String _date;
  String _completed;

  MyList(this._title, this._date, this._completed);
  MyList.withId(this._id, this._title, this._date, this._completed);

  /* Get Metotlarinin Yazimasi */
  int get id => _id;
  String get title => _title;
  String get date => _date;
  String get completed => _completed;

  /* Set Metotlarinin Yazilmasi */
  set title(String value){
    if(value.length > 2){
      _title = value;
    }
  }

  set date(String value){
    if(value.length > 2){
      _date = value;
    }
  }

  set completed(String value){
    if(value.length > 2){
      _completed = value;
    }
  }

  /* Map Olusturma */
  Map<String,dynamic> toMap(){
    var map = new Map<String,dynamic>();
    map["title"] = _title;
    map["date"] = _date;
    map["completed"] = _completed;
    if (_id != null) {
      map["id"] = _id;
    }
    return map;
  }

  /* From Object Olusturma */
  MyList.fromObject(dynamic o){
    this._id = o["Id"];
    this._title = o["Title"];
    this._date = o["Date"];
    this.completed = o["Completed"];
  }
  
}