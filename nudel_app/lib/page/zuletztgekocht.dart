

import 'package:flutter/material.dart';
import 'package:nudel_app/widgets.dart';

class page1 extends StatefulWidget{
  @override
  State<page1> createState() => _page1State();
}

class _page1State extends State<page1> {
  @override
  Widget build(BuildContext context){
  return Scaffold(

    //backgroundColor: Colors.green,
    body: Center(child: 
    Container(
      margin: new EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      //color: Color.fromARGB(255, 205, 180, 180),
      child:Column(
        
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: [
          Spacer(flex: 1,),
          Text('Letzte Gekochte Nudeln',
          style: ueberschriftstyle(),
            textAlign: TextAlign.center,
          ),
          Spacer(),
          NudelWidget("Spaghetti", "images/spaghetti (1)_Zeichenfläche 1.png"),
          
          NudelWidget("andere Nudeln", "images/andereNudeln.png"),
          NudelWidget("andere Nudeln", "images/andereNudeln.png"),
          NudelWidget("andere Nudeln", "images/andereNudeln.png"),
          //NudelWidget('asdf'),
          Spacer(),
        ],

      // child: Text ('Content 1',
      // style: TextStyle(
      // fontSize: 32,
      // )
      // )
        )
        )
    ),
        );

  
  }
}
TextStyle ueberschriftstyle(){
  return TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold);
}
