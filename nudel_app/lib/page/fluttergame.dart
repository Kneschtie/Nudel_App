import 'package:flutter/material.dart';


class FlutterGame extends StatelessWidget {
  const FlutterGame({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Nudelspiel',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
int x =0;
String s = 'https://upload.wikimedia.org/wikipedia/commons/2/2f/Edel-topf.jpg';
String l = 'https://upload.wikimedia.org/wikipedia/commons/6/63/Nudeln_trocken_makro.jpg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nudelkochzeitüberbrückungsspiel'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
         
          child: Center(
           child: Column( 
            

            mainAxisAlignment: MainAxisAlignment.spaceAround,         
            
            children: [
              Text('Versenkte Nudeln: $x', style: TextStyle(fontSize: 20),),
              /// Draggable
                  
              Draggable(
                data:
                    "https://upload.wikimedia.org/wikipedia/commons/6/63/Nudeln_trocken_makro.jpg",
               child:Positioned(
                top: 450,
                left: 400, 
                  child: Container(
                  width: 300,
                  height: 200,
                  alignment: Alignment.center,
                  color: Colors.amber,
                  child: Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/6/63/Nudeln_trocken_makro.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
               ),
                // The widget to show under the pointer when a drag is under way
                feedback: Opacity(
                  opacity: 1.0,
                  child: Container(
                    color: Colors.amber,
                    width: 300,
                    height: 200,
                    alignment: Alignment.center,
                    child: Image.network(
                      'https://upload.wikimedia.org/wikipedia/commons/6/63/Nudeln_trocken_makro.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                childWhenDragging: Opacity(
                  opacity: 0.0,
                  child: Container(
                    color: Colors.amber,
                    width: 300,
                    height: 200,
                ),
              ),
              ),
              const SizedBox(height: 50),

              /// Target
              DragTarget(
              onAccept: (data){
                setState(() {
                  //s = l;
                });
                x++;
              },
              
              
              
              
                builder: (_, candidateData, rejectedData) {
                  return Container( 
                    width: 300,
                    height: 200,
                    color: Colors.amber,
                    alignment: Alignment.center,
                    child: Image.network(
                      s,
                      fit: BoxFit.cover,
                    ),
                    
                    
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}