import 'package:flutter/material.dart';
import 'package:jamas_project/about.dart';
import 'package:jamas_project/explore.dart';
import 'package:jamas_project/home.dart';
import 'package:jamas_project/login.dart';
import 'package:jamas_project/profil.dart';
import 'package:jamas_project/singup.dart';

class ButtomNavbar extends StatefulWidget {
  @override
  _ButtomNavbarState createState() => _ButtomNavbarState();
}

class _ButtomNavbarState extends State<ButtomNavbar> {
  int _triger = 0;
  void _item_click(int index) {
    setState(() {
      _triger = index;
    });
  }
  final _listPage = [HomeScreen(),Explore(),AboutJamas()];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(height: 84,
          child: BottomNavigationBar(
            unselectedIconTheme: IconThemeData(size: 38),
            unselectedLabelStyle: TextStyle(fontSize: 15,fontFamily: "Poppins",fontWeight: FontWeight.w100),
            selectedIconTheme: IconThemeData(color: Color(0xffFF9800),size: 38),
            selectedItemColor: Color(0xffFF9800),
            selectedLabelStyle: TextStyle(color: Color(0xffFF9800),fontSize: 15,fontFamily: "Poppins",fontWeight: FontWeight.w100),
            onTap: _item_click,
            currentIndex: _triger,
            items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.space_dashboard_rounded),label: "Explore"),
            BottomNavigationBarItem(icon: Icon(Icons.info),label: "About")
          ],),
        ),
        body: _listPage.elementAt(_triger),      
      ),
    );
  }
}