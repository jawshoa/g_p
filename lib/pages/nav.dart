import 'package:flutter/material.dart';
import 'package:g_p/pages/map.dart';
import 'package:g_p/pages/Home_Screen.dart';
import 'package:g_p/pages/settings.dart';


class Nav extends StatefulWidget {
  const Nav({super.key});
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    Home_Screen(),
    Map(),
    settings(),
  ];


  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('GET PARKED',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.black),
              ),

      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),

        
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[                 // navigatoion bar items
          BottomNavigationBarItem(
            icon: Icon(Icons.home),                             // index 1
            label: 'Home',
            ),

            BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            label: 'Map',                                   // index 2
            ),

            BottomNavigationBarItem(
            icon: Icon(Icons.settings),                             // index 3
            label: 'Settings',
            ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,


        
        ),




      );     
  }
}