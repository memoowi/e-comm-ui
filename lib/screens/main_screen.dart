import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pertama/models/login_model.dart';
import 'package:flutter_pertama/screens/home_tabs/cart_page.dart';
import 'package:flutter_pertama/screens/home_tabs/home_page.dart';
import 'package:flutter_pertama/screens/home_tabs/profile_page.dart';
import 'package:flutter_pertama/screens/home_tabs/search_page.dart';

class MainScreen extends StatefulWidget {
  final LoginModel loginModel;
  const MainScreen({super.key, required this.loginModel});

  static const routeName = '/home';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int tabIndex = 0;

  void changeTabIndex(int index) {
    setState(() {
      tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: tabIndex,
        children: [
          HomePage(loginModel: widget.loginModel),
          SearchPage(),
          CartPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        currentIndex: tabIndex,
        onTap: changeTabIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
