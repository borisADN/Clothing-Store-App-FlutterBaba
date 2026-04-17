import 'package:application/home_screen.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 1;

  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  static final List<Widget> _widgetOptions = <Widget>[
    Text("second Page", style: optionStyle),
    HomeScreen(),
    Text("third Page", style: optionStyle),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff6f6f6),
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: SizedBox(
        height: 90,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.0),
              topLeft: Radius.circular(30.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                spreadRadius: 0,
                blurRadius: 10.0,
              ),
            ],
          ),

          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.0),
              topLeft: Radius.circular(30.0),
            ),
            child: BottomNavigationBar(
              elevation: 0.0,
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,

              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline_rounded, size: 30),
                  label: "person_outline",
                ),

                BottomNavigationBarItem(
                  icon: Icon(Icons.home_rounded, size: 30),
                  label: "home_filled",
                ),

                BottomNavigationBarItem(
                  icon: Icon(Icons.grid_view_rounded, size: 30.0),
                  label: "grid_view",
                ),
              ],
              currentIndex: _selectedIndex,
              unselectedItemColor: Color(0xffd0cedb),
              selectedItemColor: Color(0xff7a6fb3),
              onTap: _onItemTapped,
            ),
          ),
        ),
      ),
    );
  }
}
