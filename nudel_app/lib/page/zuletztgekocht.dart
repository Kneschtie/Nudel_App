

import 'package:flutter/material.dart';
import 'package:nudel_app/page/wichtigeVariables.dart';
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





class page1 extends StatelessWidget{

  //const page1({super.key});






@override
  
 Future< void> InitializeNudelspeicher() async{

    await Hive.initFlutter();
    var box = await Hive.openBox('NudelSpeicher');

    
    if( WichtigeVariablen().Getlastnoodle(0) != null){
      N0 = WichtigeVariablen().Getlastnoodle(0);
      if(WichtigeVariablen().getNudelName(N0) != null){
        Name0 = WichtigeVariablen().getNudelName(N0);
        if(WichtigeVariablen().getKochzeit(N0) != ''){
          Time0 = WichtigeVariablen().getKochzeit(N0);
          print('####');
          print(Time0);
          print(Name0);
        }
      }
      else{
        Name0 = 'Error';
      }
    }

    if( WichtigeVariablen().Getlastnoodle(1) != null){
      N1 = WichtigeVariablen().Getlastnoodle(1);
      if(WichtigeVariablen().getNudelName(N1) != null){
        Name1 = WichtigeVariablen().getNudelName(N1);
        if(WichtigeVariablen().getKochzeit(N1) != ''){
          Time1 = WichtigeVariablen().getKochzeit(N1);
          print('####');
          
        }
      }
      else{
        Name1 = 'Error';
      }
    }

    if( WichtigeVariablen().Getlastnoodle(2) != null){
      N2 = WichtigeVariablen().Getlastnoodle(2);
      if(WichtigeVariablen().getNudelName(N2) != null){
        Name2 = WichtigeVariablen().getNudelName(N2);
        if(WichtigeVariablen().getKochzeit(N2) != ''){
          Time2 = WichtigeVariablen().getKochzeit(N2);
          print('####');
          print(Time0);
          print(Name0);
        }
      }
      else{
        Name2 = 'Error';
      }
    }


    if( WichtigeVariablen().Getlastnoodle(3) != null){
      N3 = WichtigeVariablen().Getlastnoodle(3);
      if(WichtigeVariablen().getNudelName(N3) != null){
        Name3 = WichtigeVariablen().getNudelName(N3);
        if(WichtigeVariablen().getKochzeit(N3) != ''){
          Time3 = WichtigeVariablen().getKochzeit(N3);
          print('####');
          print(Time0);
          print(Name0);
        }
      }
      else{
        Name0 = 'Error';
      }
    }
    print('ready');
    timex ++;// Ohne das Funktioniert es aus irgendeinem Grund nicht??? 
    //Time0 = 100;       // Ohne das Funktioniert es aus irgendeinem Grund nicht??? 
    //Name0 = 'Hello';   // Ohne das Funktioniert es aus irgendeinem Grund nicht??? 
  }
  String Getname(int y){
    InitializeNudelspeicher();


    switch (y) {
      
      case 0:
         return Name0;
      break;

      case 1:
        return Name1;
      break;

      case 2:
        return Name2;
      break;
      case 3:
        return Name3;
        break;
      default:
      return 'Error';
      break;
    }
    
  }
  int Gettime(int y){
    InitializeNudelspeicher();


    switch (y) {
      
      case 0:
         return Time0;
      break;

      case 1:
        return Time1;
      break;

      case 2:
        return Time2;
      break;
      case 3:
        return Time3;
        break;
      default:
      print('problem');
      return 0;
      break;
    }
    
  }

   //void initState(){
   // super.initState();
   // InitializeNudelspeicher();
   // print('InitStateinizialized');
   // 
   // print(Time0);
   // print(Name0);
   //}
   int x= 0;
   @override
  //void setState(VoidCallback Name0) {
  //  // TODO: implement setState
  //  if(Name0 == null || Name0 == ''){
  //    x++;
  //  }
  //  super.setState(Name0);
  //}
    
  
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
          
          
          NudelWidget(Getname(0),Time0,N0, "images/spaghetti (1)_Zeichenfläche 1.png"),
          
          NudelWidget(Getname(1),Time1,N1, "images/andereNudeln.png"),
          NudelWidget(Getname(2),Time2,N2, "images/andereNudeln.png"),
          NudelWidget(Getname(3),Time3,N3, "images/andereNudeln.png"),
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

















































