import 'package:flutter/material.dart';

class NasilKullanilir extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _NasilKullanilirState();
}

class _NasilKullanilirState extends State<NasilKullanilir>{
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nasıl Kullanılır ?"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text("Nasıl Kullanılır", style: TextStyle(fontSize: 25),),
              Divider(color: Colors.black, height: 10.0,),
              Text("1-) Eklemek İstediğiniz Notu Ekle Butonuna Tıklayarak Ekleyin.", style: TextStyle(fontSize: 18),),
              Divider(),
              Text("2-) Listeden Notun Detaylarını Görmek İçin Üzerine Tıklayarak Detay Sayfasını Açabilirsiniz.", style: TextStyle(fontSize: 18),),
              Divider(),
              Text("3-) Listede Bulunan İşaret Kutusunu İşaretleyerek Notu Tamamlandı Olarak İşaretleyebilirsiniz.", style: TextStyle(fontSize: 18),),
              Divider(),
              Text("4-) Silmek İstediğiniz Notun Detay Sayfasına Giderek Sil Butonuna Tıklarsanız Not Silinir.", style: TextStyle(fontSize: 18),),
              Divider(),
              Text("5-) Notun Tamamlanma Durumunu Yine Detay Sayfası Aracalığıyla Değiştirebilirsiniz.", style: TextStyle(fontSize: 18),),
              Divider(),
              Text("6-) Bütün Listeyi Silmek İstediğiniz Zaman Ayarlar Ekranında Bulunan Bütün Listeyi Sil Butonunu Kullanabilirsiniz.", style: TextStyle(fontSize: 18),),
              Divider(color: Colors.black, height: 10.0,),

            ],
          ),
        ),
      ),
    );
  }
  
}