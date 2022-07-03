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


Widget NudelWidget(String xyz){
  return Container(
    height: 60,
    width: 150,
    child: Card(
      child: Padding(padding: const EdgeInsets.all(10.0),
      child: Text(xyz)
      ),
      ),
      );
      
}