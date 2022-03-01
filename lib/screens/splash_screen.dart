import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:travel/constants/textstyle.dart';
import 'package:travel/screens/admin_screen.dart';
import 'package:travel/screens/main_screen.dart';
import 'package:travel/service_screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  checkAuthentication() async {
    await Future.delayed(Duration(milliseconds: 5000));
    _auth.authStateChanges().listen(
      (user) {
        //////CHECK IF USER IS LOGGED IN -> HOMEPAGE
        if (user != null) {
          if (user.email == "ngoquoctu122@gmail.com") {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.rightToLeft,
                curve: Curves.easeInOut,
                reverseDuration: Duration(milliseconds: 800),
                duration: Duration(milliseconds: 800),
                child: AdminPage(),
              ),
            );
          } else {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.rightToLeft,
                curve: Curves.easeInOut,
                reverseDuration: Duration(milliseconds: 800),
                duration: Duration(milliseconds: 800),
                child: Home(),
              ),
            );
          }
        }
        //////CHECK IF USER IS NOT LOGGED IN -> LOGINPAGE.
        else if (user == null) {
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.rightToLeftWithFade,
              curve: Curves.easeInOut,
              reverseDuration: Duration(milliseconds: 500),
              duration: Duration(milliseconds: 500),
              child: LoginPage(),
            ),
          );
        }
      },
    );
  }

  void initState() {
    super.initState();
    this.checkAuthentication();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              "assets/images/splash_bg.png",
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Text(
              "GALAXITE",
              style: kStyleSplashScreen,
            ),
          ),
          /*Positioned(
            bottom: 50,
            right: 50,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      duration: Duration(milliseconds: 800),
                      child: Logi,
                    ));
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Opacity(
                    opacity: 0.3,
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Colors.blueGrey, shape: BoxShape.circle),
                    ),
                  ),
                  Image.asset(
                    "assets/images/arrow_splash.png",
                    width: 56,
                    height: 56,
                  ),
                ],
              ),
            ),
          ),*/
        ],
      ),
    );
  }
}
