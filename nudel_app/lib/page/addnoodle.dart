
import 'package:flutter/material.dart';
import 'package:nudel_app/main.dart';

class Addnoodles extends StatefulWidget{
  @override
  State<Addnoodles> createState() => _AddnoodlesState();
}

class _AddnoodlesState extends State<Addnoodles> {
   @override
   Widget build(BuildContext context) => Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.orange,
        leading: Builder(
         builder: (BuildContext context) {
         return IconButton(
          icon: const Icon(Icons.menu),
        onPressed: () {
        MaterialPageRoute(builder: (context) => const NudelApp());
        }
      );
    },
  ),

    )
   );
} 












//   Widget build(BuildContext context) => Scaffold(
//
//      appBar: AppBar(
//        backgroundColor: Colors.orange,
//        leading: Builder(
//         builder: (BuildContext context) {
//         return IconButton(
//          icon: const Icon(Icons.menu),
//        onPressed: () {
//        MaterialPageRoute(builder: (context) => const NudelApp());
//        }
//      );
//    },
//  ),
//
//    )
//   );





   // body:Container(
   //   color: Colors.teal,
   //   child:Center      
   //   (
   //     child: Text ('Content 2',
   //     style: TextStyle(
   //     fontSize: 32,
   //     )
   //     )
   //     )
//
//
   //     )
   //     
   //     );

  

