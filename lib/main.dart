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
        child: Column(children: [SearchSection(),HotelSection()],) 
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
    return Container(
      color: Colors.grey[200],
      padding: EdgeInsets.fromLTRB(10, 25, 10, 10),
      child: Column(children: [
       // Container(height: 50, color: Colors.yellow ),
       Row(children: [
        
        Expanded( 
        child: 
        Container(
        height: 50, 
         padding: EdgeInsets.only(left: 5),
         decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 4,
                offset: Offset(0,3)

              ),
            ],

         ),
         child: TextField(
           decoration: InputDecoration(
             hintText: "Tunis",
             contentPadding: EdgeInsets.all(10),
             border: InputBorder.none,


           ),
         )
         )),
        SizedBox(width: 10),

         Container(
         height: 50, 
         width : 50,
         decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(25)
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 4,
                offset: Offset(0,4)

              ),
            ],

         ),
         child: ElevatedButton(
          onPressed: (){}, 
          child: Icon(Icons.search, size: 26),
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            padding: EdgeInsets.all(10),
            primary: d_green,
          )
          
          )


        )
         
        
         
       ]),
      

        
       Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
          Container(
            margin: EdgeInsets.all(10),
            child: 
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text("Choose date",  style: GoogleFonts.nunito( 
                                        color: Colors.grey,
                                        fontSize: 15)),
                SizedBox(height: 8),
              Text("12 Dec - 22 Dec", style: GoogleFonts.nunito( 
                                        color: Colors.black,
                                        fontSize: 17))],) 
            ),
            Container(
            margin: EdgeInsets.all(10),
            child: 
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text("Number of Rooms",  style: GoogleFonts.nunito( 
                                            color: Colors.grey ,
                                            fontSize: 15) ),
              SizedBox(height: 8),
              Text("1 Room - 2 Adults", style: GoogleFonts.nunito( 
                                        color: Colors.black,
                                        fontSize: 17))
              ]) 
            )

       ],)

      ],));

  }
 
}
class HotelSection extends StatelessWidget{
  @override
  Widget build(BuildContext context)
  {
    return Container(height: 2000,
    padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: 50,
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("550 hotels found",  style: GoogleFonts.nunito( 
                                        color: Colors.black,
                                        fontSize: 15)),
                          Row(children: [Text("Filters",  style: GoogleFonts.nunito( 
                                        color: Colors.black,
                                        fontSize: 15)),
                                         IconButton(
                                        icon: Icon(Icons.filter_list_outlined, 
                                                    color: d_green,
                                                    size: 25 ),
                                        onPressed: null)
                                                                 ],)                                      ],
                                        
                                        
                                        
                        )
            
            
            
            ),
           Container(color: Colors.blue, height: 1000)


        ],)
    );
  }
 
}

