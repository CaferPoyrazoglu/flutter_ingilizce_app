import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ingilizce_app/pages/kelimeler.dart';
import 'package:flutter_ingilizce_app/pages/quiz.dart';
import 'package:flutter_ingilizce_app/theme/MyTheme.dart';

class RouteScreen extends StatefulWidget {
  @override
  _RouteScreenState createState() => _RouteScreenState();
}

class _RouteScreenState extends State<RouteScreen> {
  var _selectedPageIndex;
  List<Widget> _pages;
  PageController _pageController;

  @override
  void initState() {
    super.initState();

    _selectedPageIndex = 0;
    _pages = [Kelimeler(), Quiz()];
    _pageController = PageController(initialPage: _selectedPageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: bodyGetir(), bottomNavigationBar: bottomNavBarGetir(context));
  }

  SizedBox bottomNavBarGetir(BuildContext context) {
    return SizedBox(
      height: MyTheme.appNavHeight,
      child: Container(
        decoration: BoxDecoration(),
        child: BottomNavyBar(
          animationDuration: Duration(milliseconds: 250),
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          backgroundColor: MyTheme.renkBeyaz,
          selectedIndex: _selectedPageIndex,
          showElevation: false,
          itemCornerRadius: 8,
          curve: Curves.easeIn,
          onItemSelected: (selectedPageIndex) {
            setState(() {
              _selectedPageIndex = selectedPageIndex;
              _pageController.jumpToPage(selectedPageIndex);
            });
          },
          items: <BottomNavyBarItem>[
            /* BottomNavyBarItem(
              icon: Icon(Icons.home_rounded),
              title: Text('Anasayfa'),
              activeColor: MyTheme.renkSiyah,
              textAlign: TextAlign.center,
            ),*/
            BottomNavyBarItem(
              icon: Icon(
                Icons.menu_book_rounded,
              ),
              title: Text('Kelimeler'),
              activeColor: MyTheme.renkSiyah,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(
                Icons.create_rounded,
              ),
              title: Text('Quiz'),
              activeColor: MyTheme.renkSiyah,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  PageView bodyGetir() {
    return PageView(
      onPageChanged: (int page) {
        setState(() {
          _selectedPageIndex = page;
        });
      },
      controller: _pageController,
      physics: BouncingScrollPhysics(),
      children: _pages,
    );
  }
}
