

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:nudel_app/page/fluttergame.dart';

class page3 extends StatelessWidget{
  @override
  Widget build(BuildContext context) => Scaffold(
    body:Column(
      children: [
        TextButton.icon(
  onPressed: () {
      // Respond to
      // button press
      runApp(FlutterGame());
  },
  icon: Icon(Icons.gamepad, size: 18),
  label: Text("Play game"),
)
      ],

        
        ),);

  


}