import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
const d_green=Color(0xFF54D3C2);
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hotel Booking',
      home : HomePage(),

    );
  }
}
class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Column(children: [SearchSection(),Container(height: 1500, color: Colors.red)],) 
      ,)

    );
  }
}


class MyAppBar extends StatelessWidget implements PreferredSizeWidget{
  
  Size get preferredSize => new Size.fromHeight(50);
  @override
  Widget build(BuildContext conetext)
  {
    return AppBar(
      leading: IconButton(
      icon: Icon(Icons.arrow_back, 
                  color: Colors.grey[800],
                  size: 20 ),
      onPressed: null), 
      centerTitle: true,
      title: Text("Explore", 
      style: GoogleFonts.nunito( 
        color: Colors.black,
        fontSize:  22,
        fontWeight: FontWeight.w800
      )),
      actions: [
      IconButton(
      icon: Icon(Icons.favorite_outline_rounded, 
                  color: Colors.grey[800],
                  size: 20 ),
      onPressed: null),
      IconButton(
      icon: Icon(Icons.place, 
                  color: Colors.grey[800],
                  size: 20 ),
      onPressed: null)
      ],
      backgroundColor: Colors.white,
    );
  } 

}

class SearchSection extends StatelessWidget{
  @override
  Widget build(BuildContext context)
  {
    return Container(height: 300,
      color: Colors.grey[200]);
  }
 
}
