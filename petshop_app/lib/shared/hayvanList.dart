import 'package:flutter/material.dart';
import 'package:petshop_app/Screens/detay.dart';
import '../models/hayvan.dart';

class HayvanList extends StatefulWidget {
  @override
  _HayvanListState createState() => _HayvanListState();
}

class _HayvanListState extends State<HayvanList> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  List<Widget> _hayvanTiles = [];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  Tween<Offset> _offset = Tween(begin: Offset(1,1), end:Offset(0,0));

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _addHayvan();
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return AnimatedList(
        key: _listKey,
        initialItemCount: _hayvanTiles.length,
        itemBuilder: (context, index,animation){
          return SlideTransition(
              child: _hayvanTiles[index],
              position: animation.drive(_offset)
          );

        });
  }

  _addHayvan() {
    List<Hayvan> _hayvanlar = [
      Hayvan(ad: "Köpek", fiyat: "1000",adet: "15",img:"kopek.jpg"),
      Hayvan(ad: "Aslan", fiyat: "12000",adet: "4",img:"aslan.jpg"),
      Hayvan(ad: "Balık", fiyat: "200",adet: "50",img:"balik.jpg"),
      Hayvan(ad: "Kanguru", fiyat: "10000",adet: "2",img:"kanguru.jpg"),
      Hayvan(ad: "Kaplumbağa", fiyat: "400",adet: "8",img:"kaplumbaga.jpg"),
      Hayvan(ad: "Kedi", fiyat: "500",adet: "45",img:"kedi.jpg"),
      Hayvan(ad: "Kuzu", fiyat: "5000",adet: "19",img:"kuzu.jpg"),
      Hayvan(ad: "Panda", fiyat: "15000",adet: "1",img:"panda.jpg"),
      Hayvan(ad: "Papağan", fiyat: "400",adet: "10",img:"papagan.jpg"),
      Hayvan(ad: "Tavşan", fiyat: "250",adet: "22",img:"tavsan.jpg")

    ];
    Future ft = Future((){
    });
    _hayvanlar.forEach((Hayvan h) {

      ft = ft.then((_){
        return Future.delayed(const Duration(milliseconds: 100),(){
          _hayvanTiles.add(_buildTile(h));
          _listKey.currentState.insertItem(_hayvanTiles.length-1);
        });
      });

    });
  }
  Widget _buildTile(Hayvan h) {

    return ListTile(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_){
          return Detay(hayvan: h,);
        }));
      },
      contentPadding: EdgeInsets.all(25),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${h.adet} adet",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.deepPurple),
          ),
          Text(h.ad,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ],
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Hero(
            tag: 'img-${h.img}',
            child: Image.asset('images/${h.img}', height: 50.0,width: 50.0,)),
      ),
      trailing: Text('${h.fiyat} TL',
        style: TextStyle(color: Colors.deepOrange),
      ),
    );
  }
}


