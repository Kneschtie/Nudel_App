import 'dart:ffi';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nudel_app/page/Nudelinformationen.dart';
import 'package:nudel_app/page/addnoodle.dart';
import 'package:nudel_app/page/AlleNudeln.dart';
import 'package:nudel_app/page/nudeluebersich.dart';
import 'package:nudel_app/page/wichtigeVariables.dart';
import 'package:nudel_app/page/zuletztgekocht.dart';
import 'package:nudel_app/widgets.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
int x = 0;
  int y = 1;



Future<void> main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  
  
  await Hive.initFlutter();
  var box = await Hive.openBox('NudelSpeicher');
  
  
  //box.put('firstStart', 'true');
    
    int i0 = 300;
    int i1 = 420;
    int i2 = 360;
     if(box.get('firstStart')!= 'false' ||box.get('firstStart')!= null){
      	box.put('firstStart', 'false');

        box.put('Nudel 0', 'Spaghetti');
        box.put('Nudel.time 0', i0);

        box.put('Nudel 1', 'Macheroni');
        box.put('Nudel.time 1', i1);

        box.put('Nudel 2', 'Piccolini Penne');
        box.put('Nudel.time 2', i2);

        box.put('Nudel 3', 'Risoni');
        box.put('Nudel.time 3', i2);

        box.put('letzte0', 0); // die letzte gekochte Nudel index null
        box.put('letzte1', 1);
        box.put('letzte2', 2);
        box.put('letzte3', 3);
        print('Zugeordnet');
        //Test

    }
   
    print(box.get('firstStart'));


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
  print('gesamte Anzahl');
  print(x);
  WichtigeVariablen().setAmountofNoodles(x);
  y = x + 1;
  //  (box.get('Nudel $x')!=null )|| (box.get('Nudel $y)') != null)){ //Falls mal eine Nudel herausgelöscht wurde
  //  print('Name' + box.get('Nudel $x')); 
//
  // 
  //  
  //  print(box.get('Nudel.time $x')); 
  //  
  //  x++;
  //  y = x +1;


  
  

   // IM ersten Teil ist der Name, im Zweiten die zu kochende Zeit, im Dritten wann zuletzt gekocht wurde (4. ist dann für das Zugehörige Bild)
  for(int i=0; i<x; i++){
    if(box.get('Nudel  $i') != null){ //Falls ein leeres Element da war, die nächsten Elemente nach vorn Verschieben
      //NudelArray(i , 1) = box.get('Nudel  $i');
    }

  }

  for (int i=0; i<=x ; i++){
    
    WichtigeVariablen().Nudelname(box.get('Nudel $i'), box.get('Nudel.time $i'),i);

    //WichtigeVariablen.Nudelnameliste.add(box.get('Nudel $i'));

  }
  for (int i=0; i<4; i++){
    WichtigeVariablen().setLastNoodles(i, box.get('letzte$i'));

  }
  print('############');
  WichtigeVariablen().allesAusgeben();
  runApp(const NudelApp());

  

}

class NudelApp extends StatefulWidget {
  const NudelApp({super.key});
  void refreshVariables() async{
    await Hive.initFlutter();
  var box = await Hive.openBox('NudelSpeicher');
     for (int i=0; i<=x ; i++){
    
    WichtigeVariablen().Nudelname(box.get('Nudel $i'), box.get('Nudel.time $i'),i);

    //WichtigeVariablen.Nudelnameliste.add(box.get('Nudel $i'));

  }
  for (int i=0; i<4; i++){
    WichtigeVariablen().setLastNoodles(i, box.get('letzte$i'));

  }
  print('############');
  }

  
  @override
  State<NudelApp> createState() => _NudelAppState();
}


  String NudelanPlatz(int z){
    return ("test");
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
                  icon: Icon(Icons.ramen_dining)),
                Tab(icon: Icon(Icons.menu_book)),
                Tab(icon: Icon(Icons.sports_esports)),
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
            //runApp(Addnoodles());
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