import 'package:flutter/material.dart';
import 'package:sign_in_test/features/main_screen/presentation/pages/my_profile_page.dart';
import 'package:sign_in_test/features/main_screen/presentation/pages/my_projects_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedTab = 0;

  final _myProjectPage = GlobalKey<NavigatorState>();
  final _myProfilePage = GlobalKey<NavigatorState>();

  void _onItemTapped(int index) {
    if (index == _selectedTab) {
      switch (index) {
        case 0:
          _myProjectPage.currentState?.popUntil((route) => route.isFirst);
        case 1:
          _myProfilePage.currentState?.popUntil((route) => route.isFirst);
      }
    } else {
      setState(() {
        _selectedTab = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedTab,
        children: [
          Navigator(
              key: _myProjectPage,
              onGenerateRoute: (route) => MaterialPageRoute(
                  settings: route,
                  builder: (context) => const MyProjectPage())),
          Navigator(
              key: _myProfilePage,
              onGenerateRoute: (route) => MaterialPageRoute(
                  settings: route,
                  builder: (context) => const MyProfilePage())),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[300],
        currentIndex: _selectedTab,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.space_dashboard_rounded), label: 'Мои проекты'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded), label: 'Мой аккаунт')
        ],
      ),
    );
  }
}
