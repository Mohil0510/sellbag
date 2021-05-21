import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:sellbag/constants.dart';

import 'package:sellbag/screen/home_page/home_page.dart';
import 'package:sellbag/screen/my_cart_page/my_cart.dart';
import 'package:sellbag/screen/my_favorite_page/my_favorits.dart';
import 'package:sellbag/screen/my_profile_page/my_porfile.dart';

class BottomBarPage extends StatefulWidget {
  @override
  _BottomBarPageState createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  int currentIndex = 0;

  List<Widget> currentPage = [
    HomePage(),
    MyCart(),
    MyFavorits(),
    MyPorfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentPage[currentIndex],
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 48,
        color: Colors.white,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => setState(() => currentIndex = 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: Svg('assets/icons/drawer/home.svg'),
                    color: currentIndex == 0 ? secondarycolor : Colors.black54,
                    height: 23,
                  ),
                  Text(
                    'Home',
                    style: TextStyle(
                      color:
                          currentIndex == 0 ? secondarycolor : Colors.black54,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () => setState(() => currentIndex = 1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('assets/icons/drawer/shoppingbag2.png'),
                    color: currentIndex == 1 ? secondarycolor : Colors.black54,
                    height: 23,
                  ),
                  Text(
                    'My Cart',
                    style: TextStyle(
                      color:
                          currentIndex == 1 ? secondarycolor : Colors.black54,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () => setState(() => currentIndex = 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: Svg('assets/icons/drawer/heart.svg'),
                    color: currentIndex == 2 ? secondarycolor : Colors.black54,
                    height: 23,
                  ),
                  Text(
                    'Favorits',
                    style: TextStyle(
                      color:
                          currentIndex == 2 ? secondarycolor : Colors.black54,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () => setState(() => currentIndex = 3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: Svg('assets/icons/drawer/avatar.svg'),
                    color: currentIndex == 3 ? secondarycolor : Colors.black54,
                    height: 23,
                  ),
                  Text(
                    'Profile',
                    style: TextStyle(
                      color:
                          currentIndex == 3 ? secondarycolor : Colors.black54,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
