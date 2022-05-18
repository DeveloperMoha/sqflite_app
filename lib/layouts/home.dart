import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../network/local/sqfliteDB.dart';
import '../shared/styles/styles.dart';
import '../../shared/constants/constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  DB_WORK db = DB_WORK();
  String x = tasks.toString();
  static const List<Widget> widgetOptions = <Widget>[
    Text("ffgdg", style: optionStyle),
    Text("Screen with index 1" , style: optionStyle),
    Text("Screen with index 2" , style: optionStyle),
  ];



  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  void initState() {

    super.initState();

    //-------------------we call creating db fun in initstate here because initstate execute before build fun
    db.createDB();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Testing Sqflite"),
      ),
      body: Center(
      child:
      //widgetOptions.elementAt(_selectedIndex),
        Text("hello ${tasks[0]["title"] } , ${tasks[0]["date"] }, ${tasks[0]["time"] },  ,,,,,,,  hello ${tasks[6]["title"] } , ${tasks[6]["date"]} , ${tasks[6]["time"]} "),
    ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red[800],
        onTap: _onItemTapped,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){

          db.insertToDB();
        },
        child: Icon(Icons.add_box),
      ),
    );
  }
}
