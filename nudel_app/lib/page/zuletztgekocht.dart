

import 'package:flutter/material.dart';
import 'package:nudel_app/widgets.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
int N0 = 0;
  String Name0 = '';
  int Time0 = 0;


  int N1 = 0;
  String Name1 = '';
  int Time1 = 0;

  int N2 = 0;
  String Name2 = '';
  int Time2 = 0;

  int N3 = 0;
  String Name3 = '';
  int Time3 = 0;

  int timex = 0;





class page1 extends StatefulWidget{
  @override
  State<page1> createState() => _page1State();
}




class _page1State extends State<page1>{
@override
  
  void InitializeNudelspeicher() async{

    await Hive.initFlutter();
    var box = await Hive.openBox('NudelSpeicher');

    
    if( box.get('letzte0') != null){
      N0 = box.get('letzte0');
      if(box.get('Nudel $N0') != null){
        Name0 = box.get('Nudel $N0');
        if(box.get('Nudel.time $N0') != ''){
          Time0 = box.get('Nudel.time $N0');

          print(Time0);
          print(Name0);
        }
      }
      else{
        Name0 = 'Error';
      }
    }

    if( box.get('letzte1') != null){
    N1 = box.get('letzte1');
    if(box.get('Nudel $N1')!= null){
        Name1 = box.get('Nudel $N1');
        if(box.get('Nudel.time $N1') != ''){
          Time1 = box.get('Nudel.time $N1');
        }
      }
      else{
        Name1 = 'Error';
      }
    
    }

    if( box.get('letzte2') != null){
    N2 = box.get('letzte2');
    if(box.get('Nudel $N2')!= null){
        Name2 = box.get('Nudel $N2');
        if(box.get('Nudel.time $N2') != null){
          Time2 = box.get('Nudel.time $N2');
        }
      }
      else{
        Name2 = 'Error';
      }
    }


    if( box.get('letzte3') != null){
    N3 = box.get('letzte3');
    if(box.get('Nudel $N3')!= null){
        Name3 = box.get('Nudel $N3');
        if(box.get('Nudel.time $N3') != null){
          Time3 = box.get('Nudel.time $N3');
        }
      }
      else{
        Name3 = 'Error';
      }
    }

    timex ++;// Ohne das Funktioniert es aus irgendeinem Grund nicht??? 
    //Time0 = 100;       // Ohne das Funktioniert es aus irgendeinem Grund nicht??? 
    //Name0 = 'Hello';   // Ohne das Funktioniert es aus irgendeinem Grund nicht??? 
  }
  

   void initState(){
    super.initState();
    InitializeNudelspeicher();
    print('InitStateinizialized');
    print(Time0);
    print(Name0);
          
    
      }
  
  Widget build(BuildContext context,){
  return Scaffold(
    
    //backgroundColor: Colors.green,
    body: Center(child: 
    Container(
      margin: new EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      //color: Color.fromARGB(255, 205, 180, 180),
      child:Column(
        
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: [
          Spacer(flex: 1,),
          Text('Letzte Gekochte Nudeln',
          style: ueberschriftstyle(),
          textAlign: TextAlign.center,
          ),
          Spacer(),
          
          NudelWidget(Name0,Time0,N0, "images/spaghetti (1)_Zeichenfläche 1.png"),
          
          NudelWidget(Name1,Time1,N1, "images/andereNudeln.png"),
          NudelWidget(Name2,Time2,N2, "images/andereNudeln.png"),
          NudelWidget(Name3,Time3,N3, "images/andereNudeln.png"),
          //NudelWidget('asdf'),
          Spacer(),
        ],

      // child: Text ('Content 1',
      // style: TextStyle(
      // fontSize: 32,
      // )
      // )
        )
        )
    ),
        );

  
  }
}
TextStyle ueberschriftstyle(){
  return TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold);
}
