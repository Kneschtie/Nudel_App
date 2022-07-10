
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nudel_app/main.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';



class Nudelinfos extends StatefulWidget{
  @override
  State<Nudelinfos> createState() => _NudelinfosState();

  



}



class _NudelinfosState extends State<Nudelinfos> {
  int Kochzeitinfosite = 0;
  
  static int x = 0;
static int y= 0;
static int Nudelx = 0; // number of the Nudel index
static String Nudelname = '';

 void InitializeNudelspeicher() async{

  await Hive.initFlutter();
    var box = await Hive.openBox('NudelSpeicher');
    if(box.get('number') != null){
    Nudelx = box.get('number');
    print('Index der Nudel');
    print(Nudelx);
    if(box.get('Nudel $Nudelx') != null){
    Nudelname = box.get('Nudel $Nudelx');
    if(box.get('Nudel.time $Nudelx') != 0){
      Kochzeitinfosite = box.get('Nudel.time $Nudelx');
    }
    }
    else{
      Nudelname = '';
    }
    }
    else{
      print('Error');
    }
   

}
void DeleteaktuelleNudel()async{
  await Hive.initFlutter();
  var box = await Hive.openBox('NudelSpeicher');
  box.put('Nudel $Nudelx', null);

}

void Neusortieren()async{
  x = 0;
  y = 0;
  await Hive.initFlutter();
    var box = await Hive.openBox('NudelSpeicher');
  bool stop = false;
while(stop == false){
    y = x + 1;
    if((box.get('Nudel $x') != null ) && (box.get('Nudel $x') != '')){
      
      print(x);
      print(box.get('Nudel $x'));
      x++;
      
    }
    else if((box.get('Nudel $y') != null ) && (box.get('Nudel $y') != '')){
      	
        box.put('Nudel $x', box.get('Nudel $y'));        
        box.put('Nudel.time $x', box.get('Nudel.time $y'));

        box.put('Nudel $y', null);
        box.put('Nudel.time $y', null);
        
    }
    else{
      x --; //Der Index muss bei 0 beginnen
      stop = true;
    } 

  }
}
  @override
  
  initState(){
    super.initState;
    InitializeNudelspeicher();
    print('InitStateinizialized');
      }
  Widget build(BuildContext context){


      
      return MaterialApp(

        

        home: Scaffold(
        
        appBar: AppBar(
          
          title:       
          
           Text('$Nudelname',
          //textAlign: TextAlign.center, //macht nichts
          ),
          
       backgroundColor: Colors.orange,
       leading: Builder(
        builder: (BuildContext context) {
        return IconButton(
         icon: const Icon(Icons.arrow_back),
       onPressed: () {
       
        runApp(NudelApp());
       //MaterialPageRoute(builder: (context) => const NudelApp());
       }
       
     );
     
   },
 ),
 actions: [
  
  IconButton(onPressed:(() {
    DeleteaktuelleNudel();
    Neusortieren();
    runApp(NudelApp());
   }
  
  
  ),
   icon: const Icon(Icons.delete),
  ),
 ],
 
   ),
   
   body: Center(
    child: Column(
      children: [
        Text('$Nudelname'),
        Text('$Kochzeitinfosite'),
      ],
    ) ,
   ),

        ),
      );
  }
}

  