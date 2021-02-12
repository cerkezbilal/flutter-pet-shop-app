import 'package:flutter/material.dart';
import 'package:petshop_app/shared/baslik.dart';
import 'package:petshop_app/shared/hayvanList.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30,),
            SizedBox(height: 100,
            child: Center(
              child: Baslik(text: "Karademir PetShop",),
            ),
            ),
            Flexible(child: HayvanList(),
            ),
          ],
        ),
      ),
    );
  }
}
