
import 'package:flutter/material.dart';
import 'package:nudel_app/main.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nudel_app/page/wichtigeVariables.dart';

int x = 0;
int y = 0;

String Name = '';
int Time = 0;

class page2 extends StatelessWidget{

  void EinlesenNameundTime () async{
      await Hive.initFlutter();
       var box = await Hive.openBox('NudelSpeicher');
       Name = 'asdfasdf';
       Time = 23;

  }

 String Getnames(int index){



      x ++;

      if (Name != null || Name != ''){
        print('hello');
      return 'hello';
      }
      else{
        return 'Error';
      }
  }

  
  
 
  @override

  Widget build(BuildContext context){
    
    return ListView.builder(
      
      padding: const EdgeInsets.all(16),

        itemBuilder: (context, i){
          print(i);
          int lll = WichtigeVariablen().getKochzeit(i);
          print (lll);
          print(WichtigeVariablen().getNudelName(i));
          
          if(WichtigeVariablen().getNudelName(i) != 'test'){
          return ListTile(
            
            title: Row(children: [
              
                Text(WichtigeVariablen().getNudelName(i),
                style: TextStyle(fontSize: 20,
                fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text('$lll s',
                style: TextStyle(fontSize: 20,
                fontWeight: FontWeight.bold),),
              
              
            ],
            ),);
           
          

          }
          else{
            return Text('');
          }
        },
        
        );

  

  }
}