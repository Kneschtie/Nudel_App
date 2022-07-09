import 'package:flutter/material.dart';
import 'package:nudel_app/page/addnoodle.dart';


Widget customAppBAr (String title) { 
  @override
  //final List<Tab> icons = <Tab>[
  //  Tab(icon: Icon(Icons.home)),
  //  Tab(icon: Icon(Icons.ramen_dining)),
  //  Tab(icon: Icon(Icons.settings)),
  //];
  final List<Tab> myTabs = <Tab>[
    Tab(icon: Icon(Icons.home)),
    Tab(icon: Icon(Icons.ramen_dining)),
    Tab(icon: Icon(Icons.settings)),
  ];
  
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.home)),
                Tab(icon: Icon(Icons.ramen_dining)),
                Tab(icon: Icon(Icons.settings)),
              ],
            ),
        )
      )
            );
          
  }


Widget NudelWidget(String xyz, int Time, String internetadress){
  return InkWell(
    onTap: (){ runApp(Addnoodles());
    },
    child: Container(
    
    height:100,
    width: 400,
    
    //color: Colors.green,
    child: Card(
      
      
      shape: RoundedRectangleBorder(
      
        borderRadius: BorderRadius.all(Radius.circular(20))),
        elevation: 3,
    color: Color.fromARGB(255, 245, 245, 138),
      child: Padding(padding: const EdgeInsets.all(15),   
    child: Center(
      
      
          child: Row(children: [
        Image.asset(internetadress,),
        Spacer(),
        
          Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
          Text(xyz,        
          style: TextStyle(color: Colors.black, fontSize: 20, ),
          ),
          Spacer(),
          Text ('$Time s',
          textAlign: TextAlign.right,
          style: TextStyle(color: Colors.black, fontSize: 20, ),
          ),
          ],
        ),
        
        
        
          
      ],
          ),
       ),
       ),
    ),
    
    ),

      );
      
}