

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
    body:Container(
      color: Colors.white,
      child:Column      
      (
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Letzte Gekochte Nudeln'),
          NudelWidget("xyz"),
          NudelWidget('asdf'),
        ],

        
        

       




      // child: Text ('Content 1',
      // style: TextStyle(
      // fontSize: 32,
      // )
      // )
        )
        )
        );

  
  }
}
