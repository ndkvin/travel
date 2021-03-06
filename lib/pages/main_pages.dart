import 'package:flutter/material.dart';
import 'package:travel/pages/navpages/bar_item_page.dart';
import 'package:travel/pages/navpages/home_page.dart';
import 'package:travel/pages/navpages/my_page.dart';
import 'package:travel/pages/navpages/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({ Key? key }) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  List pages = [
    const HomePage(),
    const BarItemPage(),
    const SearchPage(),
    const MyPage(),
  ];

  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        onTap: onTap,
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.apps),
          ),
          BottomNavigationBarItem(
            label: 'Bar',
            icon: Icon(Icons.bar_chart),
          ),
          BottomNavigationBarItem(
            label: 'Search',
            icon: Icon(Icons.search)
          ),
          BottomNavigationBarItem(
            label: 'My',
            icon: Icon(Icons.person)
          ),
        ]
      ),
    );
  }
}