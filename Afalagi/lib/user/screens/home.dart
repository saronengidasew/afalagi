import 'package:Afalagi/user/screens/home_user_list.dart';
import 'package:flutter/material.dart';


class Stories extends StatefulWidget {
  @override
  _StoriesState createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue.shade900,
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueGrey,
      ),
      
    );
  }
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0; 

  final tabs = [
        HomeUsersList(),
        Stories()
  ] ;

  

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AfalaGi'),
        centerTitle: true,
        backgroundColor: Color(0xffD4AB72),
      ),
      body:tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        iconSize: 40,
        backgroundColor: Color(0xffD4AB72),
        elevation: 10,
        //selectedFontSize: 20,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.white,
        unselectedItemColor: Colors.grey.shade700,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,),
            title: Text(''),
            backgroundColor: Colors.white ),
            
          BottomNavigationBarItem(
            icon: Icon(Icons.add_a_photo,),
            title: Text(''),
            backgroundColor: Colors.yellow ),
            
           
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      
      
       
    );
  }
}
