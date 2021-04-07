import 'package:flutter/material.dart';
import 'package:kepp/pages/createBuild.dart';
import 'package:kepp/pages/home.dart';
import 'package:kepp/pages/savedBuilds.dart';

class RouteManager extends StatefulWidget {
  @override
  _RouteManagerState createState() => _RouteManagerState();
}

class _RouteManagerState extends State<RouteManager> {
  int _index = 1;
  final _pageOptions = [
    CreateBuild(),
    Home(),
    SavedBuilds(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2b343f),
      body: _pageOptions[_index],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF1C272E),
        onTap: (newIndex) => setState(() => _index = newIndex),
        currentIndex: _index,
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.keyboard,
              color: Colors.white,
              size: 40,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.home,
              color: Colors.white,
              size: 40,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.folder,
              color: Colors.white,
              size: 40,
            ),
          )
        ],
      ),
    );
  }
}
