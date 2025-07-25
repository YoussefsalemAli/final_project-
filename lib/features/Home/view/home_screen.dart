import 'package:final_project/Core/Colors/all_colors.dart';
import 'package:final_project/features/Home/view/Screens/home_tab.dart';
import 'package:final_project/features/Orders/view/orders_tab.dart';
import 'package:final_project/features/favorite/view/favorite_tab.dart';
import 'package:final_project/features/Profile/view/profile_tab.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String route = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  final List<Widget> _tabs = const [
    HomeTab(),
    FavoriteTab(),
    OrdersScreen(),
    ProfileTab(),
  ];

  void _onTabTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void _onPageChanged(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        physics: const BouncingScrollPhysics(),
        children: _tabs,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        iconSize: 25,
        onTap: _onTabTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.black,
        items: const [
          
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.home_rounded),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_sharp),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: '',
          ),
        ],
      ),
    );
  }
}
