

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nudel_app/main.dart';


final _neuesKey = GlobalKey<FormState>();

class Addnoodles extends StatelessWidget{
  const Addnoodles ({super.key});
  
  @override
  Widget build(BuildContext context){


    int valuetime = 0;
    String valuename = '';


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
    key:_neuesKey,
    child: Padding(padding: const EdgeInsets.all(10),
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
        SizedBox(height: 40,),
        TextFormField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Kochdauer in Sekunden',
            border: OutlineInputBorder(),

          ),
        validator: zahlValidator,
        inputFormatters: <TextInputFormatter>[
           FilteringTextInputFormatter.digitsOnly,

        ],

        ),
        SizedBox(height: 30,),
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.blueGrey,
              textStyle: TextStyle(color: Colors.white),
            ),
            onPressed: (){
              runApp(NudelApp());
            },
            child: Text('Löschen'),
           ),
           SizedBox(width: 25,),
           ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            textStyle: TextStyle(color: Colors.white)),
                        onPressed: () {
 /*                         // Wenn alle Validatoren der Felder des Formulars gültig sind.
                          if (_neuesKey.currentState.validate()) {
                             print(
                               "Formular ist gültig und kann verarbeitet werden");
                          } else {
                            print("Formular ist nicht gültig");
                          }
                          */
                        },
                        child: Text('Speichern'),
                      )

              
          ],
        ),
       
        SizedBox(height: 40,),
      

      ],
    ),
   
   
    ),
   ),
      
      ),
    );
  }

 String zahlValidator(value) {
    var zahl = int.tryParse(value.toString()) ?? 0;
    if (zahl % 2 == 0) {
      return 'Es sind nur ungerade Zahlen erlaubt';
    }
    return '';
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

  

