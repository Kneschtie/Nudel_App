import 'package:flutter/material.dart';


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


Widget NudelWidget(String xyz, String internetadress){
  return Container(
    
    height:100,
    width: 250,
    //color: Colors.green,
    child: Card(
    color: Color.fromARGB(255, 245, 245, 138),
    
      
      
    child: Row(children: [
        Image.asset(internetadress),
        Text(xyz),
        
      ]
      
       
      ),
       ),
      
      
      
      
      
      );
      
}