

import 'package:flutter/material.dart';

class page1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) => Scaffold(
    body:Container(
      color: Colors.red,
      child:Center      
      (
        child: Text ('Content 1',
        style: TextStyle(
        fontSize: 32,
        )
        )
        )
        )
        );

  


}