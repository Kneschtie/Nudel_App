import 'package:flutter/material.dart';
import 'package:nudel_app/main.dart';

class addnoodles extends StatelessWidget{
  
   @override
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

    




Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        
          appBar: AppBar(
        backgroundColor: Colors.orange,
        leading: Builder(
         builder: (BuildContext context) {
         return IconButton(
          icon: const Icon(Icons.arrow_back),
        onPressed: () {
        runApp(NudelApp());
        }
      );
    },
  ),

          )
        )
      
    );
        
}
}















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

  

