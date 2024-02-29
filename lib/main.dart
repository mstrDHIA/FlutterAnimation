import 'package:flutter/material.dart';
import 'package:test_animation/models/person.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, });

  


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Person> persons=[
    Person(name: "Montasar", path: "assets/ras_dhia.png"),
    Person(name: "Sakloub",path: "assets/ras_ouni.png"),
    Person(name: "Boustanig", path: "assets/ras_boustangi.png"),
    Person(name: "Putin",path: "assets/ras_alaa.png"),
    Person(name: "Anginioor", path: "assets/ras_burak.png"),
    Person(name: "Raso Kbir",path: "assets/ras_salim.png"),
    Person(name: "Sabot", path: "assets/ras_fourat.png"),
    Person(name: "7oudhayfa",path: "assets/ras_ahmed.png"),
  ];
  bool makeBigger=true;
  bool rotate=true;
  bool moveit=true;
  int index=0;


  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      
      drawer: Drawer(
        
        child: Container(
        // decoration: BoxDecoration(border: Border.symmetric(horizontal: BorderSide(width: 1,color: Colors.black,))),
        child: ListView.builder(
          // padding: EdgeInsets.only(top: 16),
          itemCount: persons.length,
          itemBuilder: (context,i)=>Container(
            decoration: BoxDecoration(border: Border.symmetric(horizontal: BorderSide(width: 1,color: Colors.black,))),
            child: ListTile(
              onTap: () {
                setState(() {
                  index=i;
                  Navigator.pop(context);
                });
              } ,
            leading: Image.asset(persons[i].path),
            title: Text(persons[i].name),
                  ),
          )),
      )),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        // leading: IconButton(icon:Icon(Icons.menu,color: Colors.white),
        // onPressed: (){
        //   // Scaffold.of(context).openDrawer();
        // },
        // ),
        backgroundColor: ColorScheme.fromSeed(seedColor: Colors.deepPurple).inversePrimary,
        title: Text(persons[index].name,
        style: TextStyle(color: Colors.white),
        ),
        ),
     
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          //  Animated 
            AnimatedSlide(
              duration: Duration(milliseconds: 500),
              offset: (moveit)?Offset(0, 0):Offset(2, 2),
              child: AnimatedRotation(
                duration: Duration(seconds: 1),
                turns: (rotate)?0:2,
                child: AnimatedContainer(
                  // transform: (rotate)?Matrix4.rotationZ(0):Matrix4.rotationZ(12.56),
                  duration: Duration(seconds: 1),
              
                  width: (makeBigger)?200:500,
                  child: Image.asset(persons[index].path,
                  width: (makeBigger)?200:500,),
                ),
              ),
            ),
            ElevatedButton(onPressed: (){
              setState(() {
                makeBigger=!makeBigger;
              });
            }, child: Text((makeBigger)?"Make it bigger":"Make it smaller")),
             ElevatedButton(onPressed: (){
              setState(() {
                rotate=!rotate;
              });
            }, child: Text((rotate)?"Rotate Left":"Rotate Right")),
            ElevatedButton(onPressed: (){
              setState(() {
                moveit=!moveit;
              });
            }, child: Text((moveit)?"Move it":"Move it")),
          ],
        ),
      )
    );
  }
}
