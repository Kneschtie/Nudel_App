

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
      bool stop =false;
    x= 0;
    y=0;



    await Hive.initFlutter();
    var box = await Hive.openBox('NudelSpeicher');
      
    
    while(stop == false){
    y = x + 1;
    if((box.get('Nudel $x') != null ) && (box.get('Nudel $x') != '')){
      
      print(x);
      print(box.get('Nudel $x'));
      x++;
      
    }
    else if((box.get('Nudel $y') != null ) && (box.get('Nudel $y') != '')){
      	
        box.put('Nudel $x', box.get('Nudel $y'));

    }
    else{
      x --; //Der Index muss bei 0 beginnen -> man wäre 1 zu hoch eingestellt
      stop = true;
    } 

  }
  print('gesamte Anzahl');
  print(x);
  y = x + 1;

  
  
  }

  @override
  Widget build(BuildContext context){
    
    void updateUserText(String text){
      setState(() {
        print(text);
        Nudelname = text;
      });
    }
    void updateTime(String Time){
      setState(() {
        
        if(Time != ''){
        print('$Time');
        Kochzeit = int.parse(Time);
        }
        else{
          print('0');
        }
      });
    }
    

    int valuetime = 0;
    String valuename = '';


    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("neue Nudel N:$y",
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
          onChanged: updateUserText ,
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
          onChanged: updateTime ,
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
           Spacer(),


           ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.orange,
                            textStyle: TextStyle(color: Colors.white)),
                        onPressed: () {
                          // Wenn alle Validatoren der Felder des Formulars gültig sind.
                          if (_neuesKey.currentState!.validate() ) {
                            EinlesendesTimers();
                             print("Formular ist gültig und kann verarbeitet werden");
                               print(Nudelname);
                               Datensetzen();
                               runApp(NudelApp());
                               
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
    print('Datengesetzt');
    print(box.get('Nudel $y'));
    print(box.get('Nudel.time $y'));
    print('$y');


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

  

