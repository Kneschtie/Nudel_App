
import 'package:flutter/material.dart';
import 'package:nudel_app/main.dart';


final _neuesKey = GlobalKey<FormState>();

class Addnoodles extends StatelessWidget{
  const Addnoodles ({super.key});
  
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("erstelle neue Nudel"),
       backgroundColor: Colors.orange,
       leading: Builder(
        builder: (BuildContext context) {
        return IconButton(
         icon: const Icon(Icons.arrow_back),
       onPressed: (
        
       ) {
        runApp(NudelApp());
       //MaterialPageRoute(builder: (context) => const NudelApp());
       }
     );
   },
 ),
   ),


   body: Form(
    key:  _neuesKey,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget> [
        Spacer(flex: 1,),
      TextFormField(
          keyboardType: TextInputType.text,
          autocorrect: true,
          decoration: InputDecoration(
          labelText: 'Name',
          border: OutlineInputBorder(),
          ),
        ),
        Spacer(flex: 1,)
        
      

      ],
    )
   
   
   ),
      
      ),
    );
  }


}


/*

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

*/










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

  

