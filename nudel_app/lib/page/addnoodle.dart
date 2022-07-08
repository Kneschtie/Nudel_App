

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nudel_app/main.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

var Nudelname = '';
int Kochzeit = 0;


final _neuesKey = GlobalKey<FormState>();

class Addnoodles extends StatefulWidget{
  

  const Addnoodles ({super.key});

  @override
  State<Addnoodles> createState() => _AddnoodlesState();
}

class _AddnoodlesState extends State<Addnoodles> {
  void EinlesendesTimers() async{
      
    x= 0;
    y=0;

    await Hive.initFlutter();
    var box = await Hive.openBox('NudelSpeicher');
      
    while((box.get('Nudel  $x')!=null )|| (box.get('Nudel $y+1)') != null)){ //Falls mal eine Nudel herausgelöscht wurde
        x++;
      y = x +1;

  }

  
  
  }

  @override
  Widget build(BuildContext context){
    
    void updateUserText(String text){
      setState(() {
        Nudelname = text;
      });
    }
    void updateTime(String Time){
      setState(() {
        Kochzeit = int.parse(Time);
      });
    }
    

    int valuetime = 0;
    String valuename = '';


    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("neue Nudel N:$x",
          //textAlign: TextAlign.center, //macht nichts
          ),
          
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
          onFieldSubmitted: updateUserText ,
          keyboardType: TextInputType.text,
          autocorrect: true,
          decoration: InputDecoration(
          labelText: 'Name',
          border: OutlineInputBorder(),
          
          ),
        
          
          validator: (value) {
        if (value == '') {
          return 'Bitte Nudelnamen eingeben!';
        }
        
    return null;
  },
  
        ),
        SizedBox(height: 40,),
        TextFormField(
          onFieldSubmitted: updateTime ,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Kochdauer in Sekunden',
            border: OutlineInputBorder(),
            icon: 
            Icon
            (Icons.timer,
            
            color: Colors.orange,

            
            )
          
          ),
          validator: (value) {
        if (value == '') {
          return 'Bitte Sekundenzahl angegeben!';
        }
        return null;
  },

        
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
                            primary: Colors.orange,
                            textStyle: TextStyle(color: Colors.white)),
                        onPressed: () {
                          // Wenn alle Validatoren der Felder des Formulars gültig sind.
                          if (_neuesKey.currentState!.validate() ) {
                             print(
                               "Formular ist gültig und kann verarbeitet werden");
                               Datensetzen();
                               
                          }
                          
                           else {
                            print("Formular ist nicht gültig");
                          }
                          
                        },
                        child: Text('Speichern'),
                      ),

              
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
}

void Datensetzen() async{
    await Hive.initFlutter();
    var box = await Hive.openBox('NudelSpeicher');
    print (Nudelname);
    box.put('Nudel $y', Nudelname);
    box.put('Nudel.time $y', Kochzeit);


  }







/*String zahlValidator(value) {
    var zahl = int.tryParse(value.toString()) ?? 0;
    if (zahl % 2 == 0) {
      return 'Es sind nur ungerade Zahlen erlaubt';
    }
    return '';
  }
  */
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

  

