import 'package:flutter/material.dart';
import 'package:jamas_project/about.dart';
import 'package:jamas_project/explore.dart';
import 'package:jamas_project/home.dart';
import 'package:line_icons/line_icons.dart';


class ButtomNavbar extends StatefulWidget {
  @override
  _ButtomNavbarState createState() => _ButtomNavbarState();
}

class _ButtomNavbarState extends State<ButtomNavbar> {
  int _triger = 0;
  void _itemClick(int index) {
    setState(() {
      _triger = index;
    });
  }

  final _listPage = [HomeScreen(), Explore(), AboutJamas()];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          height: 84,
          child: BottomNavigationBar(
            unselectedIconTheme: IconThemeData(size: 38),
            unselectedLabelStyle: TextStyle(
                fontSize: 15,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w100),
            selectedIconTheme:
                IconThemeData(color: Color(0xffFF9800), size: 38),
            selectedItemColor: Color(0xffFF9800),
            selectedLabelStyle: TextStyle(
                color: Color(0xffFF9800),
                fontSize: 15,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w100),
            onTap: _itemClick,
            currentIndex: _triger,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(LineIcons.campground), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(LineIcons.globe), label: "Explore"),
              BottomNavigationBarItem(icon: Icon(LineIcons.userAlt), label: "About")
            ],
          ),
        ),
        body: _listPage.elementAt(_triger),
      ),
    );
  }
}
