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
    width: 400,
    
    //color: Colors.green,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20))),
        elevation: 3,
    color: Color.fromARGB(255, 245, 245, 138),
      child: Padding(padding: const EdgeInsets.all(5),   
    child: Center(
          child: Row(children: [
        Image.asset(internetadress,),
        Spacer(),
        Text(xyz,
        
        style: TextStyle(color: Colors.black, fontSize: 18, ),
        
        ),
        
        
      ],
          ),
       ),
       ),
    ),
      );
      
}