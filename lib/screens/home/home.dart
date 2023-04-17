import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shaadi_book/my_app_config/app_color_constants.dart';
import 'package:shaadi_book/my_app_config/app_font_family.dart';
import 'package:shaadi_book/screens/home/home_page.dart';
import 'package:shaadi_book/screens/nav_screens/favorite_screens/favorite_screen.dart';
import 'package:shaadi_book/screens/nav_screens/profile/profile.dart';
import '../utils/custom_navigation_bar/gbutton.dart';
import '../utils/custom_navigation_bar/gnav.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Text(
      'Likes',
      style: optionStyle,
    ),
    Text(
      'Favorite',
      style: optionStyle,
    ),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorConstant.scaffoldColor,
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22.0),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child: GNav(
            rippleColor: Colors.grey[300]!,
            hoverColor: Colors.grey[100]!,
            gap: 8,
            activeColor: AppColorConstant.fontColor,
            iconSize: 20,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: const Duration(milliseconds: 400),
            tabBackgroundColor: AppColorConstant.primaryColor.withOpacity(0.1),
            color: AppColorConstant.fontColor,
            textStyle: const TextStyle(
              fontFamily: montserrat,
              fontSize: 12.0,
              fontWeight: FontWeight.w500,
            ),
            tabs: [
              GButton(
                icon: SvgPicture.asset(
                  'assets/svg/home.svg',
                  width: 20.0,
                  height: 20.0,
                ),
                text: 'Home',
                borderRadius: BorderRadius.circular(12.0),
              ),
              GButton(
                icon: SvgPicture.asset(
                  'assets/svg/book.svg',
                  width: 20.0,
                  height: 20.0,
                ),
                text: 'Book',
                borderRadius: BorderRadius.circular(12.0),
              ),
              GButton(
                icon: SvgPicture.asset(
                  'assets/svg/heart.svg',
                  width: 20.0,
                  height: 20.0,
                ),
                text: 'Search',
                borderRadius: BorderRadius.circular(12.0),
              ),
              GButton(
                icon: SvgPicture.asset(
                  'assets/svg/user_avatar.svg',
                  width: 20.0,
                  height: 20.0,
                ),
                text: 'Profile',
                borderRadius: BorderRadius.circular(12.0),
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              if (index == 2) {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const FavoriteScreen(),
                  ),
                ).then((value) {
                  setState(() {
                    _selectedIndex = 0;
                  });
                });
              } else {
                setState(() {
                  _selectedIndex = index;
                });
              }
            },
          ),
        ),
      ),
    );
  }

  // Widget _buildBottomBar() {
  //   return CustomAnimatedBottomBar(
  //     containerHeight: 70,
  //     backgroundColor: Colors.white,
  //     selectedIndex: _currentIndex,
  //     showElevation: true,
  //     itemCornerRadius: 24,
  //     curve: Curves.easeIn,
  //     onItemSelected: (index) => setState(() => _currentIndex = index),
  //     items: <BottomNavyBarItem>[
  //       BottomNavyBarItem(
  //         icon: Icon(Icons.apps),
  //         title: Text('Home'),
  //         activeColor: Colors.green,
  //         // inactiveColor: _inactiveColor,
  //         textAlign: TextAlign.center,
  //       ),
  //       BottomNavyBarItem(
  //         icon: Icon(Icons.people),
  //         title: Text('Users'),
  //         activeColor: Colors.purpleAccent,
  //         // inactiveColor: _inactiveColor,
  //         textAlign: TextAlign.center,
  //       ),
  //       BottomNavyBarItem(
  //         icon: Icon(Icons.message),
  //         title: Text(
  //           'Messages ',
  //         ),
  //         activeColor: Colors.pink,
  //         // inactiveColor: _inactiveColor,
  //         textAlign: TextAlign.center,
  //       ),
  //       BottomNavyBarItem(
  //         icon: Icon(Icons.settings),
  //         title: Text('Settings'),
  //         activeColor: Colors.blue,
  //         // inactiveColor: _inactiveColor,
  //         textAlign: TextAlign.center,
  //       ),
  //     ],
  //   );
  // }
}
