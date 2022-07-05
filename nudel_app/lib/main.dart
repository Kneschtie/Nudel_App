

import 'package:flutter/material.dart';
import 'package:nudel_app/page/addnoodle.dart';
import 'package:nudel_app/page/einstellungen.dart';
import 'package:nudel_app/page/nudeluebersich.dart';
import 'package:nudel_app/page/zuletztgekocht.dart';
import 'package:nudel_app/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';



void main() {



  
  runApp(const NudelApp());
}

class NudelApp extends StatefulWidget {
  const NudelApp({super.key});

  @override
  State<NudelApp> createState() => _NudelAppState();
}

class _NudelAppState extends State<NudelApp> {
 
          
            @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home:
      
      
      DefaultTabController(
        length: 3,
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
            
            centerTitle: true,

          title: Text("Nudel App",
          style: TextStyle(fontSize: 26,
          fontWeight: FontWeight.bold),


          ),
            backgroundColor: Colors.orange,
          
          
            
            ),

          
          body: Center(
            child: TabBarView(
                      
            children:  [
              
            page1(),
            page2(),
             page3(),
            ],
            
          ),
        ),
          floatingActionButton: FloatingActionButton(
          onPressed: () {
            runApp(Addnoodles());
          },
          tooltip: 'Füge Nudeln hinzu',
          child: Icon(Icons.add),
          backgroundColor: Colors.orange,
),
        ),
        ),
      
      
    );
  }
}

//@override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: DefaultTabController(
//        length: 3,
//        child: Scaffold(
//          appBar: AppBar(
//            bottom: const TabBar(
//              tabs: [
//                Tab(
//                  icon: Icon(Icons.home)),
//                Tab(icon: Icon(Icons.ramen_dining)),
//                Tab(icon: Icon(Icons.settings)),
//              ],
//            ),
//            
//            centerTitle: true,
//
//          title: Text("Nudel App"),
//            backgroundColor: Colors.orange,
//
            
          









































/*


import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';







void main(){
  runApp(MyApp());
}



class Timingtimer extends StatelessWidget{
Widget.build(BuildContext context)

}







class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'NudelApp';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 1;
  final List<Widget> _pages = <Widget>[
    Center(
      
      child: Column(
        
        //mainAxisAlignment: MainAxisAlignment.center,
        //
        //children: const [
        //  Text("Recent"),
        //  Icon(Icons.recent_actors),
        //],
        margin: const EdgeInsets.all(10.0),
        color: Colors.amber[600],
        width: 48.0,
        height: 48.0,

        
      ),
      
    ),


    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("Home"),
          Icon(Icons.home),
        ],
      ),
    ),
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("Messages"),
          Icon(Icons.ramen_dining),
        ],
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}




























//void main() {
//
//
//runApp(
//MaterialApp(
//  
// home: Scaffold(
//    backgroundColor: Colors.deepOrangeAccent,
//
//  appBar: AppBar
// (
//  
//  centerTitle: true,  
//  title: Text("Nudel Timer"), 
//  backgroundColor: Colors.blueGrey[900],
// 
// ),
// body: 
// Image(
//  image: NetworkImage('https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg') ,
//  )
// 
// ) ,
//    ),
//  );

  
  

 
//runApp(const MyApp());
  




*/

/*


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



static const String _title = 'Nudel-Timer';





  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
      
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}



 class _MyStatefulWidgetState extends State<MyStatefulWidget> {
   
   static const TextStyle optionStyle =
       TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
   int _selectedIndex = 0;
  
   static const List<Widget> _widgetOptions = <Widget>[
     (
       Text(
       'Übersicht über die letzten gekochten Nudeln',
       style: optionStyle,
      )
 
     ),
     Text(
       'Übersicht der Verschiedenen Sorten',
       style: optionStyle,
     ),
     Text(
       'Eigene Einstellungen',
       style: optionStyle,
     ),
   ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nudel App'),
        
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ramen_dining),
            label: 'Nudelsorten',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settinges',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 255, 183, 0),
        onTap: _onItemTapped,
        
      ),
    );
  }
}







*/



 /*
 
 
 
 
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nudel App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.yellow,
      ),
      home: const MyHomePage(title: 'Die beschte Nudel APPPPPPPPPPPPP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}



*/