import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:travel/body_screens/home_body.dart';
import 'package:travel/screens/aboutus_screen.dart';
import 'package:travel/screens/contactus_screen.dart';
import 'package:travel/screens/detail_screen.dart';
import 'package:travel/screens/search_screen.dart';
import '../constants/textstyle.dart';
import '../models/monhoc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:animations/animations.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

final listS = <monhoc>[python, python_nangcao, reactjs, reactjs_nangcao, nodejs, nodejs_nangcao];

class Home extends StatefulWidget {
  @override
  HomeScreen createState() {
    return new HomeScreen();
  }
}

class HomeScreen extends State<Home> {
  bool ChangeColor = false;
  bool borderColor = false;
  double opacity = 0;
  bool displayNameisEmpty = true;
  //////SCREENS
  int currentIndex = 1;
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final screens = [
      SearchPage(),
      BodyHome(),
      ContactUsPage(),
    ];
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xff3D2946),
                image: DecorationImage(
                  image: AssetImage("assets/images/drawer.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 34,
                      child: Icon(
                        FontAwesome5Solid.user_astronaut,
                        color: Color(0xffe87cac),
                        size: 40,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(_auth.currentUser.email, style: kStyleDrawerEmail),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.bottomToTop,
                    curve: Curves.easeInOut,
                    reverseDuration: Duration(milliseconds: 300),
                    duration: Duration(milliseconds: 300),
                    child: AboutUsPage(),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 0.1, color: Colors.black),
                  ),
                ),
                child: ListTile(
                  leading: Icon(
                    FontAwesome5Solid.users,
                    color: Colors.black.withOpacity(0.8),
                    size: 22,
                  ),
                  title: Text("Về nhà phát triển", style: kStyleListTitle),
                  trailing: Icon(
                    FontAwesome5Solid.arrow_right,
                    color: Color(0xffe87cac),
                    size: 14,
                  ),
                ),
              ),
            ),
            Container(
              height: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Signout(context);
                    },
                    child: AnimatedContainer(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      margin: EdgeInsets.only(left: 40, right: 40, top: 50),
                      width: width,
                      duration: Duration(milliseconds: 800),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xff3e4680),
                        border: Border.all(
                          width: 1.5,
                          color: Color(0xff3e4680),
                        ),
                      ),
                      child: Text(
                        "Đăng Xuất",
                        style: kStyleButtonLogout,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.black, width: 0.1))),
        child: BottomNavigationBar(
          backgroundColor: Color(0xfff6f6f6),
          selectedIconTheme: IconThemeData(
            color: Color(0xfffe87cac).withOpacity(0.7),
          ),
          selectedItemColor: Color(0xfffe87cac).withOpacity(0.7),
          unselectedItemColor: Colors.black54,
          currentIndex: currentIndex,
          selectedLabelStyle: kStyleBottomNavigatorItem,
          unselectedLabelStyle: kStyleBottomNavigatorItem,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                EvaIcons.bookOpenOutline,
                size: 24,
              ),
              label: "Khóa học",
              activeIcon: Icon(EvaIcons.bookOpen),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                EvaIcons.homeOutline,
                size: 24,
              ),
              label: "Trang chủ",
              activeIcon: Icon(EvaIcons.home),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                EvaIcons.phoneCallOutline,
                size: 24,
              ),
              label: "Liên hệ",
              activeIcon: Icon(EvaIcons.phoneCall),
            ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: PageTransitionSwitcher(
        transitionBuilder: (child, primaryAnimation, secondaryAnimation) => FadeThroughTransition(
          animation: primaryAnimation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        ),
        child: screens[currentIndex],
      ),
    );
  }

  void Signout(context) async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
